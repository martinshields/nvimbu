# nvimbu - Neovim backup directory


cd ~/nvimbu

cat > README.md << 'EOF'
# nvimbu — Neovim Config Backup

This repository contains a **full backup** of your Neovim configuration (`~/.config/nvim`).

---

## Restore Neovim Config

To restore your Neovim setup from this backup:

```bash
# Backup current config (just in case)
mv ~/.config/nvim ~/.config/nvim.backup.$(date +%s)

# Restore from this repo
cp -r ~/nvimbu ~/.config/nvim

# Or if you want to be selective (recommended):
rsync -a ~/nvimbu/ ~/.config/nvim/
