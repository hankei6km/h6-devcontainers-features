
# prepare-commit-msg-context (prepare-commit-msg-context)

Install a prepare-commit-msg hook script to /usr/local/share(the script writes the commit content as a comment).

## Example Usage

```json
"features": {
    "ghcr.io/hankei6km/h6-devcontainers-features/prepare-commit-msg-context:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|


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

---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/hankei6km/h6-devcontainers-features/blob/main/src/prepare-commit-msg-context/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
