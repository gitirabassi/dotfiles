
backup:
	brew bundle dump --force --file=/Users/gitirabassi/.dotfiles/brew/Brewfile

backup-code-extention:
	code --list-extensions > vscode/extensions.txt

install:
	bash install.sh
	brew bundle install --file=brew/Brewfile
	rustup-init
