#!/usr/bin/env bash

###############################################################################
# Use HomeBrew to install every package/app needed                            #
###############################################################################

# Check for Homebrew,
# Install if we don't have it
# Force the deletion of potential old homebrew installation
rm -rf /opt/homebrew
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

brew bundle --file=~/macos-setup/Brewfile

# Remove outdated versions from the cellar.
brew cleanup
