#!/bin/bash

# OmakubDotfiles Installation Script
# This script installs dotfiles and configurations

set -e

echo "Installing OmakubDotfiles..."

# Create backup directory
BACKUP_DIR=~/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)
mkdir -p "$BACKUP_DIR"
echo "Backup directory created at $BACKUP_DIR"

# Backup existing dotfiles
echo "Backing up existing dotfiles..."
for file in .bashrc .gitconfig .profile .inputrc .XCompose; do
    if [ -f ~/"$file" ]; then
        cp ~/"$file" "$BACKUP_DIR/"
        echo "  Backed up $file"
    fi
done

# Copy home dotfiles
echo "Installing home dotfiles..."
cp home/.bashrc ~/
cp home/.gitconfig ~/
cp home/.profile ~/
cp home/.inputrc ~/
cp home/.XCompose ~/
echo "  Dotfiles installed"

# Copy utility scripts
echo "Installing utility scripts..."
cp home/*.sh ~/
chmod +x ~/*.sh
echo "  Scripts installed"

# Copy config directories
echo "Installing config directories..."
mkdir -p ~/.config

for dir in alacritty btop fastfetch Code Cursor nvim; do
    if [ -d "config/$dir" ]; then
        # Backup existing config
        if [ -d ~/.config/"$dir" ]; then
            cp -r ~/.config/"$dir" "$BACKUP_DIR/"
            echo "  Backed up config/$dir"
        fi
        # Install new config
        cp -r config/"$dir" ~/.config/
        echo "  Installed config/$dir"
    fi
done

echo ""
echo "Installation complete!"
echo "Backups saved to: $BACKUP_DIR"
echo ""
echo "To apply bash changes, run: source ~/.bashrc"
