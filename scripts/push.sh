#!/usr/bin/env bash
# Simple helper to add, commit, and push changes to origin/main
# Usage: ./scripts/push.sh "your commit message"

set -euo pipefail

MSG=${1:-"Update project"}

echo "Running: git add ."
git add .

echo "Running: git commit -m \"$MSG\""
git commit -m "$MSG" || {
  echo "No changes to commit or commit failed.";
}

echo "Pushing to origin main..."
git push origin main

echo "Done."
