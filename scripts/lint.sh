#!/bin/bash

set -e 

echo "Linting feature script files"
# run lint-feature script on all feature directories
for dir in src/*/ ; do
    echo "Linting ${dir}"
    ./scripts/lint-feature.sh "$(basename "${dir}")"
done
echo "passed"

echo "Linting workfows"
actionlint
echo "passed"
