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

step "0. Original repository + a teammate who already added a feature"
git init -q --bare original.git
git clone -q original.git seed 2>/dev/null
( cd seed && printf 'def hello():\n    return "hello"\n' > lib.py && git add . && git commit -qm "Initial commit" && git push -q origin main )
git clone -q original.git teammate
( cd teammate && printf '\n\ndef goodbye():\n    return "goodbye"\n' >> lib.py && git commit -qam "feat: goodbye()" && git push -q origin main )

step "1. Fork (server-side copy)"
git clone -q --bare original.git fork.git          # taken after the teammate's commit
step "2. Clone the fork"
git clone -q fork.git mine && cd mine
git remote add upstream ../original.git

step "Teammate pushes another change to the original; fetch it so our branch starts from the latest code"
( cd ../teammate && echo '# docs' > DOCS.md && git add . && git commit -qm "docs: add DOCS.md" && git push -q origin main )
git fetch -q upstream && git merge -q --ff-only upstream/main && git log --oneline

step "3. New branch for my feature (existing code untouched)"
git switch -q -c feature/shout
step "4. Implement the feature and push to my fork"
printf '\n\ndef shout(text):\n    return text.upper() + "!"\n' >> lib.py
git commit -qam "feat: add shout()"
git push -q -u origin feature/shout
step "5. Pull request fork:feature/shout -> original:main (GitHub UI); maintainer merges it"
git -C ../seed pull -q origin main
git -C ../seed fetch -q ../fork.git feature/shout
git -C ../seed merge -q --no-ff FETCH_HEAD -m "Merge pull request #1 from fork/feature/shout"
git -C ../seed push -q origin main
git -C ../seed log --oneline --graph
grep -q "def shout" ../seed/lib.py && grep -q "def goodbye" ../seed/lib.py && echo "OK: new feature merged, teammate's code preserved"
