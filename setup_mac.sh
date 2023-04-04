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

code_extensions=(
  "4ops.packer"
  "bradlc.vscode-tailwindcss"
  "esbenp.prettier-vscode"
  "GitHub.vscode-pull-request-github"
  "GitLab.gitlab-workflow"
  "golang.go"
  "hashicorp.terraform"
  "monokai.theme-monokai-pro-vscode"
  "ms-azuretools.vscode-docker"
  "ms-kubernetes-tools.vscode-kubernetes-tools"
  "ms-python.isort"
  "ms-python.python"
  "ms-python.vscode-pylance"
  "paulvarache.vscode-taskfile"
  "redhat.vscode-yaml"
  "rust-lang.rust-analyzer"
  "SonarSource.sonarlint-vscode"
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

# Configure VS Code Path
if ! grep -qxF '# Add Visual Studio Code (code)' ~/.zprofile; then
  # Add VS Code bin path
  echo "Configuring VS Code Path"
  cat << EOF >> ~/.zprofile
# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF
fi

# Set Path Updates

source ~/.zprofile

# Install VS Code Extensions
echo "Installing VS Code Extensions..."
for extension in "${code_extensions[@]}"
do
  echo "Installing VS Code Extension $extension..."
  code --install-extension $extension
done