# kkkiio Homebrew Tap

![A beer tap combined with a command-line prompt](assets/tap-logo.png)

`kkkiio/homebrew-tap` 是个人 CLI 工具的统一 Homebrew 分发入口。目前提供 `agconf` 和 `gh-shim`。

## Installation

```bash
brew install kkkiio/tap/agconf
brew install kkkiio/tap/gh-shim
```

升级已安装的工具：

```bash
brew upgrade agconf
```

## Usage

```bash
agconf --help
gh-shim init
```

可用 Formula：

| Formula | 用途 |
|---|---|
| `agconf` | 从本地路径或 GitHub 复制 AI agent skills 和 prompts |
| `gh-shim` | 为 `gh pr view --comments` 补全 inline review threads |
