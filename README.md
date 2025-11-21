# My Neovim Config Backup (nvimbu)

This folder contains my full, working Neovim configuration (lazy.nvim-based, Lua config).

## How to Restore / Overwrite Current Neovim Config

**Warning: This will completely replace your current `~/.config/nvim` (Linux/macOS) or `%LOCALAPPDATA%\nvim` (Windows)**  
We make a backup first just in case.

### Linux / macOS / WSL / Git Bash

From the directory containing the `nvimbu/` folder:

```bash
# Backup current config (safety first)
rm -rf ~/.config/nvim.bak 2>/dev/null
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null || echo "No existing config to backup"

# Overwrite with this backup
rm -rf ~/.config/nvim
cp -r nvimbu/nvim ~/.config/nvim

# Done! Open Neovim and let lazy.nvim install/update plugins

One-liner (if you're brave – Linux/macOS only. NO BACKUPS.)

rm -rf ~/.config/nvim ~/.config/nvim.bak && cp -r nvimbu/nvim ~/.config/nvim && nvim
