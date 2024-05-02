#!/bin/bash

set -e

# Optional: Import test library bundled with the devcontainer CLI
# Provides the 'check' and 'reportResults' commands.
# shellcheck source=/dev/null
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "Check @google/clasp is installed" clasp --version
check "Check types(@types/google-apps-script) is not installed" npm list --global --depth 0 | grep -v -q "@types/google-apps-script@"

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
