#!/bin/bash

set -e

# -i で npm が使えるイメージを指定する必要がある。
# test-autogenerated ジョブでは matrix から外す。 

# Optional: Import test library bundled with the devcontainer CLI
# Provides the 'check' and 'reportResults' commands.
# shellcheck source=/dev/null
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.

check "Check @google/clasp is installed" clasp --version

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults