#!/bin/bash

# Kick things off with Homebrew.
echo "Installing homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Grab cask for installing various tools and macOS apps.
echo "Setting up cask..."
brew tap caskroom/cask

echo "Installing casks..."
brew cask install java intellij-idea-ce iterm2 sublime-text keybase

echo "Installing tools..."
brew install git node the_silver_searcher yarn python protobuf gitup jq

echo "Setting up global npm packages..."
npm install -g yarn pure-prompt http-server

echo "Restoring iTerm settings..."
defaults delete com.googlecode.iterm2
cp ./configs/iterm/com.googlecode.iterm2.plist ~/Library/Preferences
defaults read -app iTerm

echo "Restoring Sublime Text settings..."
rm -rf ~/Library/Application\ Support/Sublime\ Text\ 3/
cp ./configs/sublime-text/packages_prefs.tar.gz ~/Library/Application\ Support/
pushd ~/Library/Application\ Support/ >/dev/null
tar -zxf packages_prefs.tar.gz
rm packages_prefs.tar.gz
popd >/dev/null

# Use zsh as the default shell.
echo "Installing zsh..."
brew install zsh
chsh -s /bin/zsh
