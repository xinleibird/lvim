## How to customize LunarVim for VimR or Neovide?

Before run lunar's install script, add below lines in your `~/.zshenv` or `~/.zprofile`

```sh
export LUNARVIM_RUNTIME_DIR="$HOME/.local/share/nvim"
export LUNARVIM_CONFIG_DIR="$HOME/.config/nvim"
export LUNARVIM_CACHE_DIR="$HOME/.cache/nvim"
export LUNARVIM_BASE_DIR="$HOME/.local/share/nvim/lvim"
```

Logout OS and relogin, now you can run install script.

## Why?

GUI application in Linux/macOS just can read non-interactive environment variable, `.zshenv` and `.zprofile` are non-login environment, they are non-interactive.
