#!/bin/bash

set -e

# Optional: Import test library bundled with the devcontainer CLI
# Provides the 'check' and 'reportResults' commands.
# shellcheck source=/dev/null
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
# clasp 2.4.0 は動作しないので、パッケージの存在確認のみ行う。
check "Check @google/clasp@2.4.0 is installed" npm list --global --depth 0 | grep -q "@google/clasp@2.4.0"
check "Check types(@types/google-apps-script) is installed" npm list --global --depth 0 | grep -q "@types/google-apps-script@"

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
