# @google/gemini-cli (via npm)

この Dev Container Feature は、NPM レジストリ経由で @google/gemini-cli をインストールします。

## オプション
- `version`: インストールするバージョン。デフォルトは `latest`。

## 依存
- `ghcr.io/devcontainers/features/common-utils`
- `ghcr.io/devcontainers/features/node`

## 使い方
```jsonc
"features": {
  "google-gemini-cli": {
    "version": "latest"
  }
}
```
