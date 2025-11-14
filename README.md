# OmakubDotfiles

Personal dotfiles and configuration for Ubuntu/Omakub development environment.

## What's Inside

- **Shell configs**: `.bashrc`, `.profile`, `.inputrc`, `.gitconfig`
- **Terminal**: Alacritty configuration
- **Editors**: Neovim, VS Code, Cursor
- **Tools**: btop, fastfetch
- **Utility scripts**: System updates, MySQL fixes, chezmoi setup

## Quick Install

```bash
git clone git@github.com:Alebra88/OmakubDotfiles.git ~/OmakubDotfiles
cd ~/OmakubDotfiles
./install.sh
```

The script will backup your existing configs before applying new ones.

## Manual Install

```bash
# Backup your current configs first!
cp -r config/* ~/.config/
cp home/.* ~/
```

## Update This Repo

To save your current configs:

```bash
cd ~/OmakubDotfiles
cp ~/.bashrc ~/.gitconfig ~/.profile ~/.inputrc ~/.XCompose home/
cp -r ~/.config/{alacritty,btop,fastfetch,Code,Cursor,nvim} config/
git add .
git commit -m "Update dotfiles"
git push
```

## Requirements

These dotfiles work best with:
- Ubuntu/Omakub
- Alacritty
- Neovim
- btop, fastfetch

Review files before applying to ensure they match your setup.
