# Experiment 25 – Fork, Fetch Latest, Feature Branch, Pull Request

**Tool:** Git/GitHub  **CO:** CO4

## Scenario
A teammate has added a feature. You need the latest code, a fresh branch, and a way to deliver your own feature without disturbing existing code.

```bash
# 1. GitHub → Fork
git clone https://github.com/<you>/<repo>.git && cd <repo>      # 2. clone your fork
git remote add upstream https://github.com/<owner>/<repo>.git
git fetch upstream && git switch main && git merge upstream/main   # fetch latest (teammate's feature)
git switch -c feature/shout                                      # 3. new branch
# 4. implement + commit
git commit -am "feat: add shout()"
git push -u origin feature/shout
# 5. GitHub → "Compare & pull request" (base repository = original, base = main)
```
Offline replay: `bash demo.sh`.

Difference from Experiment 9: here the emphasis is on **syncing with `upstream` before branching**, so the feature builds on the latest code.
