# OmakubDotfiles

Personal dotfiles and configuration settings for Ubuntu/Omakub setup.

## Contents

### Home Directory Files
- `.bashrc` - Bash shell configuration
- `.gitconfig` - Git configuration
- `.profile` - Shell profile settings
- `.inputrc` - Readline input configuration
- `.XCompose` - Custom compose key sequences

### Utility Scripts
- `fix-mysql.sh` - MySQL troubleshooting script
- `update-system.sh` - System update automation
- `update_all.sh` - Comprehensive update script
- `setup-chezmoi.sh` - Chezmoi dotfile manager setup

### Config Directories
- `alacritty/` - Alacritty terminal emulator configuration
- `btop/` - System resource monitor configuration
- `fastfetch/` - System information tool configuration
- `Code/` - VS Code settings
- `Cursor/` - Cursor editor settings
- `nvim/` - Neovim configuration

## Installation

### Quick Setup
```bash
# Clone this repository
git clone git@github.com:Alebra88/OmakubDotfiles.git ~/OmakubDotfiles

# Run the installation script
cd ~/OmakubDotfiles
./install.sh
```

### Manual Setup
```bash
# Backup existing files
cp ~/.bashrc ~/.bashrc.backup
cp ~/.gitconfig ~/.gitconfig.backup

# Copy dotfiles to home directory
cp home/.bashrc ~/
cp home/.gitconfig ~/
cp home/.profile ~/
cp home/.inputrc ~/
cp home/.XCompose ~/

# Copy utility scripts
cp home/*.sh ~/

# Copy config directories
mkdir -p ~/.config
cp -r config/* ~/.config/

# Reload shell configuration
source ~/.bashrc
```

## Backup Current Settings

To update this repository with your current settings:

```bash
# Copy current dotfiles
cp ~/.bashrc ~/.gitconfig ~/.profile ~/.inputrc ~/.XCompose ~/OmakubDotfiles/home/

# Copy utility scripts
cp ~/*.sh ~/OmakubDotfiles/home/

# Copy config directories
cp -r ~/.config/alacritty ~/.config/btop ~/.config/fastfetch ~/OmakubDotfiles/config/
cp -r ~/.config/Code ~/.config/Cursor ~/.config/nvim ~/OmakubDotfiles/config/

# Commit and push changes
cd ~/OmakubDotfiles
git add .
git commit -m "Update dotfiles"
git push
```

## Notes

- Configuration files are organized into `home/` and `config/` directories
- Scripts maintain their executable permissions
- Review each file before applying to ensure compatibility with your system
- Some configurations may require additional software to be installed

## System Information

These dotfiles are configured for Ubuntu/Omakub setup with the following tools:
- Alacritty terminal
- Neovim text editor
- VS Code / Cursor editors
- btop system monitor
- fastfetch system info
