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
$code --install-extension eamodio.gitlens
$code --install-extension eamodio.remotehub
$code --install-extension ms-vscode.cpptools
$code --install-extension vscjava.vscode-java-pack
$code --install-extension twxs.cmake
$code --install-extension zxh404.vscode-proto3
$code --install-extension ms-python.python
$code --install-extension rust-lang.rust
$code --install-extension devondcarew.bazel-code
$code --install-extension timonwong.shellcheck
$code --install-extension yzhang.markdown-all-in-one
$code --install-extension joaompinto.asciidoctor-vscode
$code --install-extension slevesque.vscode-hexdump
$code --install-extension alefragnani.bookmarks
$code --install-extension vstirbu.vscode-mermaid-preview
$code --install-extension ms-vscode-remote.vscode-remote-extensionpack
$code --install-extension plorefice.devicetree
$code --install-extension matepek.vscode-catch2-test-adapter
$code --install-extension adamhartford.vscode-base64
$code --install-extension bbenoist.vagrant
$code --install-extension bpruitt-goddard.mermaid-markdown-syntax-highlighting
$code --install-extension ms-vscode-remote.remote-containers
$code --install-extension ms-vscode-remote.remote-ssh
$code --install-extension ms-vscode-remote.remote-ssh-edit
$code --install-extension ms-vscode-remote.remote-ssh-explorer
$code --install-extension ms-vscode-remote.remote-wsl
$code --install-extension redhat.java
$code --install-extension VisualStudioExptTeam.vscodeintellicode
$code --install-extension waderyan.gitblame
