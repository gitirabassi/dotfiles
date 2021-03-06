#!/bin/sh

set -e
set -x

#  Install Brew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Test brew version
brew --version

# Install all brew packages needed
brew bundle install --file=brew/Brewfile.work

# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My ZShell!"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# bash iTerm2/install.sh

# Run installation of dotfiles
bash install.sh

# Import public GPG key
curl -sSL https://github.com/gitirabassi.gpg | gpg --import -
# Adding trust to the keys trust --> 5
gpg --edit-key C34F1B7957CE6065

# Load private key stubs from yubikey
gpg --edit-card

# Restart gpg-agent
gpgconf --kill gpg-agent
gpgconf --launch gpg-agent

# Drop ssh public key on disk
ssh-add -L > ~/.ssh/id_rsa.pub

# Test encryption/description
gpg --encrypt --armor -r C34F1B7957CE6065 --output pippo.gpg README.md
gpg --decrypt pippo.gpg
rm -f pippo.gpg

# Download all repositories
cd ~ 
mr checkout
