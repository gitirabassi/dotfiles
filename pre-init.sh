#!/bin/bash

set -x -e

#  Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Test brew version
brew --version

# Install all brew packages needed
brew install git

mkdir -p ~/go/src/github.com/gitirabassi

cd ~/go/src/github.com/gitirabassi

git clone https://github.com/gitirabassi/dotfiles.git

cd dotfiles

bash init.sh
