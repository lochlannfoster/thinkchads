#!/bin/bash
# setup.sh - Create symbolic links from dotfiles repo to system locations

DOTFILES="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

# Create directories if they don't exist
mkdir -p "$CONFIG_DIR/i3"
mkdir -p "$CONFIG_DIR/i3blocks"
mkdir -p "$CONFIG_DIR/alacritty"

# Make scripts executable FIRST, before creating symlinks
chmod +x "$DOTFILES/.config/i3blocks_"*.sh

# Bash files
ln -sf "$DOTFILES/.bashrc" "$HOME/.bashrc"
ln -sf "$DOTFILES/.bash_profile" "$HOME/.bash_profile"

# i3 config
ln -sf "$DOTFILES/.config/i3/config" "$CONFIG_DIR/i3/config"

# i3blocks config and scripts
ln -sf "$DOTFILES/.config/i3blocks/config" "$CONFIG_DIR/i3blocks/config"
ln -sf "$DOTFILES/.config/i3blocks_battery.sh" "$CONFIG_DIR/i3blocks/i3blocks_battery.sh"
ln -sf "$DOTFILES/.config/i3blocks_memory.sh" "$CONFIG_DIR/i3blocks/i3blocks_memory.sh"
ln -sf "$DOTFILES/.config/i3blocks_wireless.sh" "$CONFIG_DIR/i3blocks/i3blocks_wireless.sh"
ln -sf "$DOTFILES/.config/i3blocks_workspaces.sh" "$CONFIG_DIR/i3blocks/i3blocks_workspaces.sh"

# Alacritty config
ln -sf "$DOTFILES/.config/alacritty/alacritty.yml" "$CONFIG_DIR/alacritty/alacritty.yml"

echo "Symlinks created. Your dotfiles are now linked to your system configuration."
