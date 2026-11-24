#!/usr/bin/env bash
# Replay every offline Git exercise (needs only git).
set -euo pipefail
cd "$(dirname "$0")/.."
for s in exp-*/demo.sh; do
  echo "################ $s"
  bash "$s"
done
echo "All demos finished OK"
