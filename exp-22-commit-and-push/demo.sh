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

git init -q --bare repo.git
git clone -q repo.git seed 2>/dev/null
( cd seed && echo "# Project" > README.md && git add . && git commit -qm "Initial commit" && git push -q origin main )

step "1. Clone"
git clone -q repo.git work && cd work
step "2. Modify README.md"
echo "More details about the project." >> README.md
git status --short
step "3. git add"
git add README.md
step '4. git commit -m "Updated README"'
git commit -qm "Updated README"
step "5. git push"
git push -q origin main
git log --oneline -2
test "$(git rev-parse HEAD)" = "$(git --git-dir=../repo.git rev-parse main)" && echo "OK: pushed"
