#!/bin/bash

# Check if it's WSL (Windows Subsystem for Linux)
if grep -q "Microsoft" /proc/version; then
    echo "Running on WSL"
    
    # Initialize Homebrew on WSL
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Check if it's macOS
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Running on macOS"
    
    # Start ssh-agent if not already running
    if [ -z "$SSH_AUTH_SOCK" ]; then
        eval "$(ssh-agent -s)"
        ssh-add --apple-use-keychain ~/.ssh/id_ed25519
    fi

    # Initialize Homebrew on macOS
    eval "$(/opt/homebrew/bin/brew shellenv)"

    # Initialize SDKMAN
    export SDKMAN_DIR="$HOME/.sdkman"
    if [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]]; then
        source "$SDKMAN_DIR/bin/sdkman-init.sh"
    fi
    
else
    echo "Unknown system"
fi
