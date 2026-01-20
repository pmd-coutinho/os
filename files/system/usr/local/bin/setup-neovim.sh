#!/bin/bash

# First-login neovim setup script
# This script installs neovim nightly using bob

MARKER_FILE="$HOME/.config/neovim-setup-done"

# Check if already run
if [ -f "$MARKER_FILE" ]; then
    echo "Neovim already set up, skipping..."
    exit 0
fi

echo "Setting up neovim via bob..."

# Ensure bob is in PATH (Homebrew location)
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

# Install nightly neovim
if command -v bob &> /dev/null; then
    bob install nightly
    bob use nightly
    echo "Neovim nightly installed successfully!"

    # Create marker file
    mkdir -p "$(dirname "$MARKER_FILE")"
    touch "$MARKER_FILE"
else
    echo "Error: bob not found in PATH"
    exit 1
fi
