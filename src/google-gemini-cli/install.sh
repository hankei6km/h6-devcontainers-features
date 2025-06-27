#!/usr/bin/env bash

TARGET_PACKAGE="@google/gemini-cli"
TARGET_VERSION=${VERSION:-"latest"}

set -e

# https://github.com/Balazs23/devcontainers-features/blob/main/src/nx/install.sh
command_exists() {
    command -v "$@" >/dev/null 2>&1
}
install_packages() {
    # Use a custom cache since it is unclear how the cache is handled in the feature.
    # (whether it should be deleted or kept)
    local TEMP_CACHE
    TEMP_CACHE=$(mktemp -d)
    trap 'rm -rf "${TEMP_CACHE}"' EXIT

    echo "Installing npm package: ${TARGET_PACKAGE}@${TARGET_VERSION}"
    npm install --global --omit=dev --no-progress --cache "${TEMP_CACHE}" "${TARGET_PACKAGE}@${TARGET_VERSION}"
}

# Check if npm is installed
if ! command_exists npm; then
    echo -e 'Feature requires npm to be installed. Please use a node-based image like:'
    # shellcheck disable=SC2016
    echo -e ' - mcr.microsoft.com/devcontainers/javascript-node:${VARIANT}'
    echo -e 'You can also add as feature like:'
    echo -e ' - "ghcr.io/devcontainers/features/node:1": {}'
fi

# Instal pacakges
install_packages
