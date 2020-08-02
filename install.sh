#!/usr/bin/env bash

set -xeuo pipefail

# Setup screeenshot localtion
mkdir -p ~/Documents/screenshots
ln -sf ~/Documents/screenshots ~/Desktop/screenshots
defaults write com.apple.screencapture location ~/Documents/screenshots
killall SystemUIServer
sc_auth pairing_ui -s enable

git=$(command -v git)
stow=$(command -v stow)
code=$(command -v code)

rm ~/.zshrc

$stow -t $HOME nvim 
$stow -t $HOME zsh
$stow -t $HOME git
$stow -t $HOME gnupg
$stow -t $HOME vscode
$stow -t $HOME myrepos

for ext in $(cat vscode/extensions.txt)
do
    $code --install-extension ${ext}
done
