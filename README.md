# Q4 – Feature Branch and Pull Request for Signup

## Run
```bash
python signup.py
```

## Git workflow
```bash
git checkout -b feature-signup
git add signup.py README.md
git commit -m "Add signup function"
git push -u origin feature-signup
```

Then open the GitHub repository, create a pull request from `feature-signup` into `main`, review the changes and merge it. If `main` has changed the same lines, GitHub will mark a merge conflict. Pull the latest `main`, resolve the conflict in the file, test it, commit the resolution and push again.
