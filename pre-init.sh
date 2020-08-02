#!/bin/bash

set -x -e

#  Install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Test brew version
brew --version

# Install all brew packages needed
brew install git

mkdir -p ~/go/src/github.com/gitirabassi

cd ~/go/src/github.com/gitirabassi

git clone git@github.com:gitirabassi/dotfiles.git
