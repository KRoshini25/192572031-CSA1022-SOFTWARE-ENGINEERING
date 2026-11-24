#!/usr/bin/env bash
# Run the unit tests of every Python app in the repo (each in its own process so module names don't clash).
set -euo pipefail
cd "$(dirname "$0")/.."
fail=0
for d in $(find . -name 'test_*.py' -not -path './.git/*' -exec dirname {} \; | sort -u); do
  echo "=== pytest $d"
  (cd "$d" && python3 -m pytest -q) || fail=1
done
exit $fail
