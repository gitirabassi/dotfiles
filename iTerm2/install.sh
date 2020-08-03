#!/usr/bin/env bash

killall cfprefsd || true

set -e

# Reuse previous session's directory
/usr/libexec/PlistBuddy -c "Delete :'New Bookmarks':0:'Custom Directory'" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Add :'New Bookmarks':0:'Custom Directory' string" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Custom Directory' 'Recycle'" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Normal Font' 'RobotoMono-Regular 14'" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Scrollback Lines' '100000'" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Transparency' '0.12'" ~/Library/Preferences/com.googlecode.iterm2.plist

echo "Re-open iTerm2 to apply the new settings"
