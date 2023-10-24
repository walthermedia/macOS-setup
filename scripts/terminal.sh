#!/usr/bin/env bash

###############################################################################
# My Zsh                                                                      #
###############################################################################

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Auto-suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# syntax highlightings
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

# fish live suggestion/completions
git clone https://github.com/marlonrichert/zsh-autocomplete ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-autocomplete

# completions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

# Make terminal faster
touch ~/.hushlogin

# copy dotfiles and zshrc
cp ../dotfiles/* ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}
cp -f ../.zshrc ~/


###############################################################################
# Terminal & iTerm 2                                                          #
###############################################################################

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Copy iterm Settings
sudo cp -f ../iterm/com.googlecode.iterm2.plist ~/Library/Preferences/

# Install Dracula theme for iTerm
open -a iTerm ../iterm/Dracula.itermcolors

# Set Terminal Default profile to Dracula
defaults write com.apple.terminal 'Default Window Settings' Dracula
defaults write com.apple.terminal 'Startup Window Settings' Dracula

# Install custom bat config and theme
mkdir ~/.config || true
cp -rf ../iterm/bat ~/.config || true
bat cache --build

# Install lessfilter for better preview
cp -f ../.lessfilter ~/

# Misc rc files
cp -f ../.screenrc ~/
cp -f ../.wgetrc ~/

chmod go-w '/opt/homebrew/share'
chmod -R go-w '/opt/homebrew/share/zsh'
