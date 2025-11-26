# OmakubDotfiles

Personal dotfiles and configuration for Ubuntu/Omakub development environment. This repository contains carefully curated configurations for a modern, productive development setup with a cohesive Catppuccin theme across all tools.

## What's Inside

### Shell Configuration
- **`.bashrc`** - Bash shell configuration with custom aliases and environment variables
- **`.profile`** - User environment and startup programs
- **`.inputrc`** - Readline configuration for terminal input
- **`.gitconfig`** - Git configuration with GitHub CLI credential helpers
- **`.XCompose`** - Custom keyboard compose sequences for special characters
- **`.npmrc`** - NPM configuration (global package prefix)
- **`starship.toml`** - Starship prompt configuration with custom formatting

### Terminal Emulator
- **Alacritty** - GPU-accelerated terminal emulator
  - Font: CaskaydiaMono Nerd Font
  - Theme: Catppuccin Macchiato
  - Optimized for performance and aesthetics

### Editors & IDEs
- **Neovim** - Modern Vim-based editor
  - LazyVim configuration
  - Theme: Catppuccin
  - Full plugin ecosystem with LSP support

- **VS Code** - Visual Studio Code settings
  - Font: CaskaydiaMono Nerd Font
  - Theme: Catppuccin Macchiato
  - Optimized for productivity with minimal distractions

- **Cursor** - AI-powered code editor settings
  - Synchronized configuration with VS Code

- **DataGrip 2025.2** - JetBrains database IDE
  - Editor preferences and color schemes
  - Database tool window settings
  - Custom code styles

### Development Tools
- **GitHub CLI (gh)** - GitHub command-line tool configuration
  - Editor preferences and git protocol settings
  - Custom aliases and preferences

- **lazygit** - Terminal UI for git commands
  - Custom key bindings and UI preferences
  - Enhanced git workflow

- **mise** - Development environment manager
  - Runtime version management
  - Tool version configuration

- **zellij** - Terminal workspace/multiplexer
  - Modern alternative to tmux
  - Custom layouts and key bindings

- **yazi** - Blazing fast terminal file manager
  - Vim-like keybindings
  - Image preview support
  - Catppuccin theme integration

### System Monitoring & Info
- **btop** - Modern resource monitor
  - Theme: Catppuccin
  - Optimized layout and key bindings

- **fastfetch** - Fast system information tool
  - Custom display configuration

### System Configuration
- **`mimeapps.list`** - Default applications for file types
  - File associations and default handlers

### Utility Scripts
Located in `home/`:
- **`fix-mysql.sh`** - MySQL service troubleshooting and repair
- **`update-system.sh`** - System package updates
- **`update_all.sh`** - Comprehensive system update script
- **`setup-chezmoi.sh`** - Dotfiles manager setup

## Installation

### Quick Install

```bash
git clone git@github.com:Alebra88/OmakubDotfiles.git ~/OmakubDotfiles
cd ~/OmakubDotfiles
./install.sh
```

The `install.sh` script will:
1. Create a timestamped backup of your existing configs in `~/.dotfiles_backup_YYYYMMDD_HHMMSS`
2. Install all dotfiles to their proper locations
3. Copy utility scripts to your home directory
4. Set up all application configurations

After installation, apply bash changes:
```bash
source ~/.bashrc
```

### Manual Install

If you prefer to cherry-pick specific configurations:

```bash
# Backup your current configs first!
mkdir -p ~/.config_backup
cp -r ~/.config/{alacritty,btop,fastfetch,Code,Cursor,nvim,JetBrains,gh,lazygit,zellij,mise,yazi} ~/.config_backup/
cp ~/.bashrc ~/.gitconfig ~/.profile ~/.inputrc ~/.XCompose ~/.npmrc ~/.config_backup/
cp ~/.config/{starship.toml,mimeapps.list} ~/.config_backup/

# Install specific configs
cp -r config/alacritty ~/.config/
cp -r config/nvim ~/.config/
cp home/.bashrc ~/
# ... etc
```

## Updating This Repository

To save your current system configurations back to this repo:

```bash
cd ~/OmakubDotfiles

# Copy home dotfiles
cp ~/.bashrc ~/.gitconfig ~/.profile ~/.inputrc ~/.XCompose ~/.npmrc home/

# Copy config directories
cp -r ~/.config/alacritty config/
cp -r ~/.config/btop config/
cp -r ~/.config/fastfetch config/
cp -r ~/.config/Code/User/settings.json config/Code/User/
cp -r ~/.config/Cursor/User/settings.json config/Cursor/User/
cp -r ~/.config/nvim config/
cp -r ~/.config/JetBrains/DataGrip2025.2/{options,codestyles} config/JetBrains/DataGrip2025.2/

# Copy development tool configs
cp ~/.config/starship.toml config/
cp ~/.config/gh/config.yml config/gh/
cp -r ~/.config/lazygit config/
cp -r ~/.config/zellij config/
cp -r ~/.config/mise config/
cp -r ~/.config/yazi config/
cp ~/.config/mimeapps.list config/

# Commit and push
git add .
git commit -m "Update dotfiles"
git push
```

## Requirements

### System
- Ubuntu 22.04+ or Omakub-configured Ubuntu
- Git for version control
- GitHub CLI (`gh`) for authentication

### Fonts
- **CaskaydiaMono Nerd Font** (recommended) - Main font for terminal and editors
- Or any Nerd Font for proper icon rendering

Install Nerd Fonts:
```bash
# Using Omakub
omakub install fonts

# Or manually from https://www.nerdfonts.com/
```

### Applications
These dotfiles are configured for:
- **Alacritty** - Terminal emulator
- **Neovim** - Text editor
- **VS Code** - Code editor
- **Cursor** - AI code editor
- **DataGrip** - Database IDE
- **btop** - System monitor
- **fastfetch** - System info
- **Starship** - Cross-shell prompt
- **GitHub CLI (gh)** - GitHub from terminal
- **lazygit** - Git terminal UI
- **zellij** - Terminal multiplexer
- **mise** - Runtime version manager
- **yazi** - Terminal file manager

Install missing applications:
```bash
# Alacritty
sudo apt install alacritty

# Neovim (latest)
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim

# btop
sudo apt install btop

# fastfetch
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch
sudo apt update
sudo apt install fastfetch

# Starship prompt
curl -sS https://starship.rs/install.sh | sh

# GitHub CLI
sudo apt install gh

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

# zellij
cargo install --locked zellij
# or
sudo apt install zellij

# mise
curl https://mise.run | sh

# yazi
cargo install --locked yazi-fm
# or using snap
sudo snap install yazi
```

## Theme

This configuration uses the **Catppuccin** color scheme across all applications for a cohesive look:
- **Variant**: Macchiato (dark theme with warm tones)
- **Consistency**: Same theme in terminal, editor, IDE, and system tools
- **Eye-friendly**: Carefully designed color palette for reduced eye strain

## Customization

### Changing the Theme

To switch from Catppuccin to another theme:

1. **Alacritty**: Edit `config/alacritty/theme.toml`
2. **Neovim**: Edit `config/nvim/lua/plugins/theme.lua`
3. **VS Code**: Edit `config/Code/User/settings.json` → `workbench.colorTheme`
4. **btop**: Edit `config/btop/btop.conf` → `color_theme`

### Changing Fonts

Edit the following files:
- **Alacritty**: `config/alacritty/font.toml`
- **VS Code**: `config/Code/User/settings.json` → `editor.fontFamily`
- **DataGrip**: Through the IDE settings UI

### Personal Information

Don't forget to update:
- `.gitconfig` - Your name and email
- `.XCompose` - Your personal keyboard shortcuts

## Structure

```
OmakubDotfiles/
├── config/
│   ├── alacritty/          # Terminal emulator config
│   ├── btop/               # System monitor config
│   ├── fastfetch/          # System info config
│   ├── nvim/               # Neovim editor config
│   ├── Code/               # VS Code settings
│   ├── Cursor/             # Cursor editor settings
│   ├── JetBrains/          # DataGrip IDE config
│   ├── gh/                 # GitHub CLI config
│   ├── lazygit/            # lazygit TUI config
│   ├── zellij/             # zellij multiplexer config
│   ├── mise/               # mise version manager config
│   ├── yazi/               # yazi file manager config
│   ├── starship.toml       # Starship prompt config
│   └── mimeapps.list       # Default file associations
├── home/
│   ├── .bashrc             # Bash configuration
│   ├── .gitconfig          # Git configuration
│   ├── .profile            # Shell profile
│   ├── .inputrc            # Readline config
│   ├── .XCompose           # Compose key sequences
│   ├── .npmrc              # NPM configuration
│   └── *.sh                # Utility scripts
├── install.sh              # Installation script
├── .gitignore              # Git ignore rules
└── README.md               # This file
```

## Backup Strategy

Before making changes:
1. The install script automatically creates backups
2. Keep this repo updated with your current configs
3. Test changes in a non-critical environment first

## Troubleshooting

### Fonts not rendering correctly
- Install Nerd Fonts: `omakub install fonts`
- Verify font name matches in configs
- Restart terminal after font installation

### Git authentication issues
- Ensure GitHub CLI is installed: `sudo apt install gh`
- Authenticate: `gh auth login`
- Verify credentials: `gh auth status`

### Neovim plugins not working
- Run `:Lazy sync` in Neovim to update plugins
- Check `:checkhealth` for missing dependencies

## Contributing

This is a personal dotfiles repository, but feel free to:
- Fork it for your own use
- Open issues for questions
- Submit PRs for improvements

## License

Free to use and modify for personal use.

## Resources

- [Omakub](https://omakub.org/) - Ubuntu development environment
- [Catppuccin](https://github.com/catppuccin) - Theme used throughout
- [Nerd Fonts](https://www.nerdfonts.com/) - Icon fonts
- [LazyVim](https://www.lazyvim.org/) - Neovim configuration framework
