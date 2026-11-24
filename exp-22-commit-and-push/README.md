# Experiment 22 – Commit Locally and Push to GitHub

**Tool:** Git/GitHub  **CO:** CO4

```bash
git clone https://github.com/<you>/<repo>.git && cd <repo>   # repository from Experiment 1/20
echo "More details." >> README.md                             # modify a file
git status                                                    # modified (red)
git add README.md                                             # stage  -> green
git commit -m "Updated README"                                # commit locally
git push origin main                                          # publish
git log --oneline -3
```
Concepts: working tree → staging area (index) → local repository → remote. `git restore --staged <f>` un-stages; `git commit --amend` fixes the last message.

Offline replay: `bash demo.sh`.
