#!/bin/bash

set -e

# Optional: Import test library bundled with the devcontainer CLI
# Provides the 'check' and 'reportResults' commands.
# shellcheck source=/dev/null
source dev-container-features-test-lib

# Check for installed features
check "Check prepare-commit-msg is installed" test -x /usr/local/share/prepare-commit-msg-context/prepare-commit-msg

# Check for working features
TEMP_FILE=$(mktemp)
"$(dirname "${0}")/mock-repo.sh" /usr/local/share/prepare-commit-msg-context/prepare-commit-msg "${TEMP_FILE}"
check "Check prepare-commit-msg-context is working" diff "${TEMP_FILE}" expected-diff.txt

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
