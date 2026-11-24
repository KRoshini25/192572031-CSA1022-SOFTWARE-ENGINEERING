# Experiment 24 – `feature-login` Branch and Pull Request

**Tool:** Git/GitHub  **CO:** CO4

```bash
git switch -c feature-login                    # 1. new branch
# 2. add login.py (see ./login.py)
git add login.py test_login.py
git commit -m "feat: add simple login function"   # 3. commit
git push -u origin feature-login                  #    push
# 4. GitHub → "Compare & pull request" → base: main ← compare: feature-login → Create pull request
#    review → "Merge pull request" → "Delete branch"
git switch main && git pull                       #    sync local main
```

## Files
* `login.py` – `login(username, password)` (hashed passwords, constant-time compare)
* `test_login.py` – `pytest -q`
* `demo.sh` – offline replay

Demo users: `alice / wonderland`, `bob / builder123`.
