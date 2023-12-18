#!/bin/bash

set -e

FEATURE="${1}"
test -n "${FEATURE}" || { echo "Missing feature name"; exit 1; }
FEATURE_SRC="src/${1}"
test -d "${FEATURE_SRC}" || { echo "Feature source directory not found: ${FEATURE_SRC}"; exit 1; }
FEATURE_TEST_SRC="test/${1}"
test -d "${FEATURE_TEST_SRC}" || { echo "Feature test source directory not found: ${FEATURE_TEST_SRC}"; exit 1; }

# check install.sh
shellcheck "${FEATURE_SRC}"/install.sh

# check test
shellcheck "${FEATURE_TEST_SRC}/"*.sh
