# Contributing / Git workflow

1. `git switch main && git pull origin main`
2. `git switch -c exp/NN-short-name` (or `feature/<module>`)
3. Commit small, focused changes using [Conventional Commits](https://www.conventionalcommits.org/):
   `feat(exp-12): add /health endpoint`, `docs(exp-05): justify Could-Have items`, `fix(exp-16): reject empty todo`.
4. `git fetch origin && git merge origin/main` – resolve any conflicts, then `git commit`.
5. `git push -u origin exp/NN-short-name` and open a pull request using the PR template.
6. Get at least one review, address feedback with extra commits, then **squash-merge** into `main`.

Branch naming: `exp/NN-name`, `feature/<module>`, `fix/<issue>`, `docs/<topic>`.
