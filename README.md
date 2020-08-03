# Dotfiles

This repo is very similar to github.com/fntlnz/dotfiles just with some macOS installation and configuration details

# Init
when getting a new macOS desktop or laptop follow these steps:
- follow the regular steps for initializing the macOS
- make sure you have a stable connection to the internet 
- then open a terminal window and run 
  - `curl -sSL https://raw.githubusercontent.com/gitirabassi/dotfiles/master/pre-init.sh |bash` 
- add accounts for emails, contacts, calendar, notes
- configure apple ID
- login spotify
- login slack accounts
- login signal
- login telegram

### Read battery percentage from CLI

`pmset -g batt`

## Resources
https://github.com/drduh/YubiKey-Guide
https://blog.filippo.io/touch-to-operate-password-store-yubikey-4/
https://www.alessandromenti.it/blog/2017/01/transitioning-new-gpg-keypair.html
https://github.com/herrbischoff/awesome-macos-command-line#google

## Awesome dotfiles
- https://github.com/andsens/homeshick
- https://github.com/phisco/configs
- https://github.com/webpro/awesome-dotfiles
- https://github.com/joshukraine/mac-bootstrap
- https://github.com/joshukraine/mac-bootstrap/blob/master/install/macos-defaults
- https://github.com/mathiasbynens/dotfiles/blob/main/.macos
- https://github.com/atosatto/dotfiles

## Usefull commands
- `gpgconf --list-dirs`

## to switch to a new yubikey
`gpg-connect-agent "scd serialno" "learn --force" /bye`

## Yet to codify configuration
- enable showing percentage of battery in top bar
- show bluethooh, keyboard language, vpn connection, timemachine, audio in top bar
- dock: 
  - enable auto hiding
  - disable recent used apps
  - codify list of applications which ought to be be shown
- increase speed of trackpad
- change compute name, hostname to predefined one
- enable filevault with Icloud/recovery key
- connect to AFP volume 
- add Mail account from terminal

## Fix permissions of gnupg folder

```bash
find ~/.gnupg -type f -exec chmod 600 {} \;
find ~/.gnupg -type d -exec chmod 700 {} \;
```
