#!/bin/bash

set -e

# Optional: Import test library bundled with the devcontainer CLI
# Provides the 'check' and 'reportResults' commands.
# shellcheck source=/dev/null
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "Check @google/gemini-cli@0.1.3 is installed" npm list --global --depth 0 | grep -q "@google/gemini-cli@0.1.3"
# check "Check @google/gemini-cli@0.1.3 is installed" test "$(gemini --version)" = "0.1.3"

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
