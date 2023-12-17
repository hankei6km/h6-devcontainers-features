## Install as a git hook

Please copy the script separately from installing the feature.

e.g.: Example of configuration in `.devcontainer.json`

```jsonc
{
  "features": {
      "ghcr.io/hankei6km/h6-devcontainers-features/prepare-commit-msg-context:1": {}
  },
  "postAttachCommand": "cp /usr/local/share/prepare-commit-msg-context/prepare-commit-msg .git/hooks/prepare-commit-msg"
}
```