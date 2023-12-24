#!/bin/bash
set -e

# exmaple:
# scripts/gen-release-notes.hs [feature-name] x.y.z x.y.z-1

FEATURE="${1}"
TAG="feature_${FEATURE}_${2}"
PREV_TAG="feature_${FEATURE}_${3}"
test -n "${FEATURE}" || { echo "Missing feature name"; exit 1; }

# この方法は New Contributors の整合性がとれない.
# コミットはするが一旦保留。
gh api \
  --method POST \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  '/repos/{owner}/{repo}/releases/generate-notes' \
  -f tag_name="${TAG}"\
 -f target_commitish='main' \
 -f previous_tag_name="${PREV_TAG}" \
 -f configuration_file_path=".github/release-${FEATURE}.yml" \
 -q ".body" \
 | sed '/^### Exclude from changelog/,/^### /{//!d}'  | grep -v -e "^### Exclude from changelog"
 