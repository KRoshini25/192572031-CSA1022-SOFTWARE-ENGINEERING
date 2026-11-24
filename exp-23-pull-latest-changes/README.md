# Experiment 23 – Pull the Latest Changes from GitHub

**Tool:** Git/GitHub  **CO:** CO4

```bash
cd <repo>                       # 1. repository cloned earlier
# 2. collaborator edits a file and runs: git push origin main
git fetch origin                # optional: look without merging
git status                      # "Your branch is behind 'origin/main' by 1 commit"
git pull origin main            # 3. fetch + merge
git log --oneline -3            # 4. collaborator's commit is on top
cat README.md                   #    their change is in the file
```
`git pull` = `git fetch` + `git merge`. Use `git pull --rebase` for a linear history.

Offline replay: `bash demo.sh`.
