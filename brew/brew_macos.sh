#!/bin/bash

echo "🚀 Starting Homebrew setup..."

# Ensure Homebrew is installed
if ! command -v brew &>/dev/null; then
    echo "🍺 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "✅ Homebrew already installed!"
fi

echo "🔄 Updating Homebrew..."
brew update

# Define packages
packages=(
    git
    wget
    htop
    node
    java
    maven
    postgresql
)

casks=(
    google-chrome
    firefox
    visual-studio-code
    intellij-idea-ce
    postman
)

echo "📦 Installing brew packages..."
for package in "${packages[@]}"; do
    if brew list "$package" &>/dev/null; then
        echo "✅ $package already installed, skipping."
    else
        brew install "$package"
    fi
done

echo "🖥 Installing cask applications..."
for cask in "${casks[@]}"; do
    if brew list --cask "$cask" &>/dev/null; then
        echo "✅ $cask already installed, skipping."
    else
        brew install --cask "$cask"
    fi
done

echo "🔄 Upgrading existing packages..."
brew upgrade

echo "🧹 Cleaning up..."
brew cleanup

echo "🎉 Homebrew setup complete!"

