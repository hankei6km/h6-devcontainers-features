#!/usr/bin/env sh

INSTALL_DIR="/usr/local/share/prepare-commit-msg-context"
FORMAT_TYPE=${FORMAT:-"diff-history"}

set -e

test -d "${INSTALL_DIR}" || mkdir -p "${INSTALL_DIR}"
cp "$(dirname "${0}")/prepare-commit-msg-${FORMAT_TYPE}" "${INSTALL_DIR}/prepare-commit-msg"
chmod a+x  "${INSTALL_DIR}/prepare-commit-msg"
