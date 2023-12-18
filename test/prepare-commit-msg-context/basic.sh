#!/bin/bash

set -e

# Optional: Import test library bundled with the devcontainer CLI
# Provides the 'check' and 'reportResults' commands.
# shellcheck source=/dev/null
source dev-container-features-test-lib

# Check for installed features
check "Check prepare-commit-msg is installed" test -x /usr/local/share/prepare-commit-msg-context/prepare-commit-msg

# Check for working features
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
git config --global init.defaultBranch main
# Make temp repo
TEMP_FILE=$(mktemp)
TEMP_DIR=$(mktemp -d)
pushd "${TEMP_DIR}"
git init
git commit --allow-empty -m "Initial commit"
echo "test" > test.txt
git add test.txt
# Run prepare-commit-msg
/usr/local/share/prepare-commit-msg-context/prepare-commit-msg "${TEMP_FILE}"
popd
check "Check prepare-commit-msg-context is working" diff <(sed -e 's/.\+ Initial commit/---/' < "${TEMP_FILE}") expected.txt

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
