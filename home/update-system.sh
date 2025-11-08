#!/bin/bash
# System Update Script
# Run this to update all packages on your system

set -e

echo "========================================="
echo "Starting System Update"
echo "========================================="
echo ""

# Update APT packages
echo "[1/5] Updating APT package lists..."
sudo apt update

echo ""
echo "[2/5] Upgrading APT packages..."
sudo apt upgrade -y

echo ""
echo "[3/5] Updating Snap packages..."
sudo snap refresh

echo ""
echo "[4/5] Updating Flatpak packages..."
flatpak update -y

echo ""
echo "[5/5] Cleaning up old packages..."
sudo apt autoremove -y
sudo apt clean

echo ""
echo "========================================="
echo "System Update Complete!"
echo "========================================="
