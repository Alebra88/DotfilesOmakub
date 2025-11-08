#!/bin/bash

# Script to update APT, Snap, and clean up unused packages and versions

# Update APT packages
echo "Updating APT packages..."
sudo apt update && sudo apt upgrade -y
sudo apt autoremove -y

# Update Snap packages
echo "Updating Snap packages..."
sudo snap refresh

# Clean up unused Snap versions
echo "Cleaning up old Snap versions..."
sudo snap set system refresh.retain=2  # Keep only the last 2 versions
sudo snap list --all | awk '/disabled/{print $1, $3}' | while read snap rev; do sudo snap remove "$snap" --revision="$rev"; done

# Clean up APT cache
echo "Cleaning up APT cache..."
sudo apt clean

echo "All apps have been updated and cleaned up!"
