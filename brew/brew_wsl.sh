#!/bin/bash

echo "🐧 Setting up Homebrew for WSL..."

# Ensure Homebrew is installed
if ! command -v brew &>/dev/null; then
    echo "🍺 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" 
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zshrc
fi

echo "🔄 Updating Homebrew..."
brew update

# Define CLI packages (no casks)
packages=(
    awscli		
    git
    wget
    htop
    node
    java
    maven
    postgresql
    stow
)

echo "📦 Installing CLI tools..."
for package in "${packages[@]}"; do
    if brew list "$package" &>/dev/null; then
        echo "✅ $package already installed, skipping."
    else
        brew install "$package"
    fi
done

echo "🔄 Upgrading existing packages..."
brew upgrade

echo "🧹 Cleaning up..."
brew cleanup

echo "🎉 WSL Homebrew setup complete!"

