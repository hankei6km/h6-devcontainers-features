#!/bin/bash

set -e

# Optional: Import test library bundled with the devcontainer CLI
# Provides the 'check' and 'reportResults' commands.
# shellcheck source=/dev/null
source dev-container-features-test-lib

# Check for installed features
check "Check prepare-commit-msg is installed" test -x /usr/local/share/prepare-commit-msg-context/prepare-commit-msg

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
