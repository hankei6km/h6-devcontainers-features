#!/bin/bash
set -e

# exmaple:
# scripts/ver-tag.sh [feature-name] patch
# scripts/ver-tag.sh [feature-name] prelease pre-.

FEATURE="${1}"
RANGE="${2}"
PREREL="${3}"
test -n "${FEATURE}" || { echo "Missing feature name"; exit 1; }

LATEST="$(jq -r '.version' "src/${FEATURE}/devcontainer-feature.json")"

VERSION="$(
    if [ "${RANGE}" = "prelease" ]; then
        semver bump "${RANGE}" "${PREREL}}" "${LATEST}"
    else
        semver bump "${RANGE}" "${LATEST}"
    fi
)"
echo "New version: ${VERSION}"

# Update devcontainer-feature.json
jq ".version = \"${VERSION}\"" "src/${FEATURE}/devcontainer-feature.json" > "src/${FEATURE}/devcontainer-feature.json.tmp"
mv "src/${FEATURE}/devcontainer-feature.json.tmp" "src/${FEATURE}/devcontainer-feature.json"

git add "src/${FEATURE}/devcontainer-feature.json"
MESSAGE="feature-${FEATURE}-${VERSION}"
git commit -m "${MESSAGE}"
git tag "${MESSAGE}" -am "${MESSAGE}"

echo "Operations for release:"
echo "- git push --follow-tags origin"
echo "- Run the release workflow on GitHub"
