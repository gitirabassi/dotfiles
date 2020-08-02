
backup:
	brew bundle dump --force --file=/Users/gitirabassi/.dotfiles/brew/Brewfile

install:
	bash install.sh
	brew bundle install --file=brew/Brewfile
	rustup-init
