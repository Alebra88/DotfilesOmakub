#!/usr/bin/env bash
set -euo pipefail

# ---- Configuration ----
REPO_URL="https://github.com/Alebra88/Ubuntudotfiles.git"
CHEZMOI_BIN="$HOME/.local/bin/chezmoi"

# ---- 1. Install chezmoi if needed ----
if ! command -v chezmoi &> /dev/null; then
  echo "Installing chezmoi..."
  sh -c "$(curl -fsLS get.chezmoi.io)"
  echo "Installing dir if needed..."
  mkdir -p "$(dirname "$CHEZMOI_BIN")"
  export PATH="$HOME/.local/bin:$PATH"
fi

# ---- 2. Initialize chezmoi with your repo ----
echo "Initializing chezmoi with repo $REPO_URL..."
chezmoi init "$REPO_URL"

# ---- 3. Apply all managed files ----
echo "Applying dotfiles..."
chezmoi apply

# ---- 4. Optional: commit & push local changes ----
echo "If you'd like to push updates later, run:"
echo "  chezmoi git add ."
echo "  chezmoi git commit -m \"Your message\""
echo "  chezmoi git push"

echo "🎉 All done! Managed dotfiles from $REPO_URL have been applied."
