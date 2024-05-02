#!/usr/bin/env bash

TARGET_PACKAGE="@google/clasp"
TARGET_VERSION=${VERSION:-"latest"}
TARGET_TYPES_PACKAGE="@types/google-apps-script"
TARGET_TYPES_VERSION=${TYPES:-"latest"}

set -e


# https://github.com/Balazs23/devcontainers-features/blob/main/src/nx/install.sh
command_exists() {
  command -v "$@" > /dev/null 2>&1
}
install_packages() {
  # Use a custom cache since it is unclear how the cache is handled in the feature.
  # (whether it should be deleted or kept)
  local TEMP_CACHE
  TEMP_CACHE=$(mktemp -d)
  trap 'rm -rf "${TEMP_CACHE}"' EXIT

  echo "Installing npm package: ${TARGET_PACKAGE}@${TARGET_VERSION}"
  npm install --global --omit=dev --no-progress --cache "${TEMP_CACHE}" "${TARGET_PACKAGE}@${TARGET_VERSION}"
  if test "${TARGET_TYPES_PACKAGE}" != ""; then
    echo "Installing npm package: ${TARGET_TYPES_PACKAGE}@${TARGET_TYPES_VERSION}"
    npm install --global --omit=dev --no-progress --cache "${TEMP_CACHE}" "${TARGET_TYPES_PACKAGE}@${TARGET_TYPES_VERSION}"
  fi
}

# Check if npm is installed
if ! command_exists npm; then
  echo -e 'Feature requires npm to be installed. Please use a node-based image like:'
  # shellcheck disable=SC2016
  echo -e ' - mcr.microsoft.com/vscode/devcontainers/typescript-node:${VARIANT}'
  echo -e 'You can also add as feature like:'
  echo -e ' - "ghcr.io/devcontainers/features/node:1": {}'
fi

# Instal pacakges
install_packages
