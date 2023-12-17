FROM mcr.microsoft.com/devcontainers/javascript-node:1-18-bullseye

RUN apt update -y \
    && apt install -y --no-install-recommends shellcheck \
    && rm -rf /var/lib/apt/lists/* \
    && wget -O /usr/local/bin/semver https://raw.githubusercontent.com/fsaintjacques/semver-tool/master/src/semver \
    && chmod +x /usr/local/bin/semver
