#!/bin/bash

set -e

PREPAIRE_COMMIT_MSG="${1}"
TEMP_FILE="${2}"
COMMIT_SOURCE="${3}"

# Setup git config
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
git config --global init.defaultBranch main
# Make temp repo
TEMP_DIR=$(mktemp -d)
pushd "${TEMP_DIR}"
# Mock repo
git init
git commit --allow-empty -m "Initial commit"
echo "test" > test.txt
git add test.txt
# Run prepare-commit-msg
${PREPAIRE_COMMIT_MSG} "${TEMP_FILE}" "${COMMIT_SOURCE}"
popd