# Experiment 21 – Clone an Existing Repository and Edit a File

**Tool:** Git/GitHub  **CO:** CO3

```bash
git clone https://github.com/<owner>/<repo>.git     # 2. clone (choose your own repo or a sample such as octocat/Hello-World)
cd <repo>                                           # 3. enter the folder
ls && cat README.md                                 #    open a file (or: code README.md)
# 4. edit – fix a typo or change a line, 5. save
git diff                                            # see exactly what changed
git status                                          # file shows as 'modified'
```
Outcome: the working tree contains an unstaged change (committing/pushing is the next experiment, 22).

Offline replay: `bash demo.sh`.
