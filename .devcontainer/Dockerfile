FROM mcr.microsoft.com/devcontainers/javascript-node:1-18-bullseye

RUN apt update -y \
    && apt install -y --no-install-recommends shellcheck \
    && rm -rf /var/lib/apt/lists/*
