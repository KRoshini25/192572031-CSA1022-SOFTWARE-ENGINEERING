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

step "Existing public repository"
git init -q --bare sample-repo.git
git clone -q sample-repo.git seed 2>/dev/null
( cd seed && printf 'Welcome to the sample repo.\nThis line has a typpo.\n' > notes.txt && git add . && git commit -qm "Add notes" && git push -q origin main )

step "1-2. git clone <repository_url>"
git clone -q sample-repo.git && cd sample-repo

step "3. Navigate into the directory and open a file"
ls; cat notes.txt

step "4-5. Fix the typo and save"
sed -i 's/typpo/typo/' notes.txt
git diff
git status --short
test "$(grep -c typpo notes.txt)" = 0 && echo "OK: file edited"
