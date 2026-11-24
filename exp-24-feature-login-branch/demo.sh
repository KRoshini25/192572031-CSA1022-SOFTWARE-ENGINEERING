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
( cd seed && echo "# Auth demo" > README.md && git add . && git commit -qm "Initial commit" && git push -q origin main )
git clone -q repo.git work && cd work

step "1. Create branch feature-login"
git switch -q -c feature-login
step "2. Add login.py"
cp "$HERE/login.py" login.py && cp "$HERE/test_login.py" test_login.py
python3 -c "import login; assert login.login('alice','wonderland')" && echo "login() works"
step "3. Commit and push"
git add login.py test_login.py && git commit -qm "feat: add simple login function"
git push -q -u origin feature-login
step "4. Pull request feature-login -> main, then merge (GitHub: Merge pull request)"
cd ../seed && git pull -q origin main && git fetch -q origin feature-login
git merge -q --no-ff origin/feature-login -m "Merge pull request #1 from feature-login"
git push -q origin main
git log --oneline --graph --all
test -f login.py && echo "OK: login.py is on main"
