#!/bin/bash
# sync.sh - Check for changes and sync dotfiles

cd ~/dotfiles

# Check for changes
git status

# Ask if user wants to commit changes
read -p "Commit changes? (y/n): " choice
if [[ $choice == "y" || $choice == "Y" ]]; then
    git add .
    read -p "Enter commit message: " message
    git commit -m "$message"
    git push
    echo "Changes committed and pushed."
else
    echo "No changes committed."
fi
