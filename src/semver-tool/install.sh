#!/usr/bin/env sh

REF_STRING=${REF:-"master"}

set -e

# https://github.com/devcontainers/feature-starter/issues/23
apt_get_update()
{
    echo "Running apt-get update..."
    apt-get update -y
}


# Checks if packages are installed and installs them if not
check_packages() {
    if ! dpkg -s "$@" > /dev/null 2>&1; then
        if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
            echo "Running apt-get update..."
            apt-get update -y
        fi
        apt-get -y install --no-install-recommends "$@"
    fi
}


export DEBIAN_FRONTEND=noninteractive


check_packages curl ca-certificates gnupg2 dirmngr unzip


curl -sL -o /usr/local/bin/semver "https://raw.githubusercontent.com/fsaintjacques/semver-tool/${REF_STRING}/src/semver"
chmod +x /usr/local/bin/semver
