#!/usr/bin/env bash

packages=(
    "git"
    "awscli"
    "aws-vault"
    "docker"
    "kubernetes-cli"
    "jq"
    "gh"
    "helm"
    "kustomize"
    "exa"
    "kind"
    "python"
    "pyenv"
    "pyenv-virtualenv"
    "postgresql"
    "coreutils"
    "pass"
    "watch"
    "terraform"
    "tfenv"
    "tgenv"
    "saml2aws"
    "node"
    "neofetch"
    "nvm"
    "go"
    "go-task"
    "gopls"
    "iterm2"
)

casks=(
    "google-chrome"
    "github"
    "rectangle"
    "slack"
    "firefox"
    "visual-studio-code"
    "google-drive"
    "postman"
)

# Install XCode Select

echo "Installing XCode Select"
xcode-select --install


# Install homebrew, if we don't have it already
if test ! $(which brew); then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update homebrew recipies
echo "Updating homebrew..."
brew update

# Install homebrew packages
echo "Installing homebrew packages..."
for package in "${packages[@]}"
do
  echo "Installing $package..."
  brew install $package
done

# Configure neofetch
echo "[[ ! -f $(which neofetch) ]] || neofetch" >> ~/.zshrc


brew cleanup

# Install macOS applications
echo "Installing macOS applications..."
for cask in "${casks[@]}"
do
  echo "Installing $cask..."
  brew install --cask $cask
done