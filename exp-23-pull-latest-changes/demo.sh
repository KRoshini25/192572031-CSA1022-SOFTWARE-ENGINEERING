#!/usr/bin/env bash
# Offline replay: local bare repositories play the role of GitHub. Needs only git.
set -euo pipefail
export GIT_AUTHOR_NAME="Lab Student" GIT_AUTHOR_EMAIL="student@example.com"
export GIT_COMMITTER_NAME="Lab Student" GIT_COMMITTER_EMAIL="student@example.com"
export GIT_CONFIG_GLOBAL=/dev/null GIT_CONFIG_SYSTEM=/dev/null
HERE="$(cd "$(dirname "$0")" && pwd)"
SB="$HERE/.sandbox"; rm -rf "$SB"; mkdir -p "$SB"; cd "$SB"
step() { printf '\n\033[1;34m### %s\033[0m\n' "$*"; }
git() { command git -c init.defaultBranch=main -c core.editor=true -c pull.rebase=false "$@"; }

git init -q --bare shared.git
git clone -q shared.git seed 2>/dev/null
( cd seed && echo "# Shared project" > README.md && git add . && git commit -qm "Initial commit" && git push -q origin main )

step "1. Clone (your copy)"
git clone -q shared.git mine
git clone -q shared.git collaborator

step "2. Collaborator makes a change and pushes it"
( cd collaborator && echo "Contribution from collaborator" >> README.md && git commit -qam "docs: collaborator update" && git push -q origin main )

step "Your copy is now behind"
cd mine && git fetch -q && git status -sb | head -1

step "3. git pull origin main"
git pull -q origin main

step "4. Verify the collaborator's change is here"
git log --oneline -2; cat README.md
grep -q "collaborator" README.md && echo "OK: up to date"
