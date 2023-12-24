#!/bin/bash

set -e

# Optional: Import test library bundled with the devcontainer CLI
# Provides the 'check' and 'reportResults' commands.
# shellcheck source=/dev/null
source dev-container-features-test-lib

# Check for installed features
check "Check semver-tool is installed" test -x /usr/local/bin/semver
check "Check semver-tool 3.0.0 is installed" test "$(semver --version)" = "semver: 3.0.0"

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
