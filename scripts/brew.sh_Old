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

## Install cask
brew install cask

brew bundle --file=~/macos-setup/Brewfile

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed

# Add kubectl plugins
kubectl krew index add kvaps https://github.com/kvaps/krew-index
kubectl krew index add k8s https://github.com/kubernetes-sigs/krew-index

kubectl krew install kvaps/node-shell
kubectl krew install k8s/who-can
kubectl krew install k8s/ktop
kubectl krew install k8s/ice
kubectl krew install k8s/kubescape

# Better quick look support
brew install --cask qlcolorcode
brew install --cask qlstephen
brew install --cask qlmarkdown
brew install --cask quicklook-json
brew install --cask qlprettypatch
brew install --cask qlvideo
brew install --cask suspicious-package
brew install --cask webpquicklook
brew install --cask quicklook-csv
brew install --cask betterzip

# restart quick look
qlmanage -r

# Remove outdated versions from the cellar.
brew cleanup
