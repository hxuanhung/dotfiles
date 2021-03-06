#!/usr/bin/env bash

# Porting from .macos to this

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName "HungMac"
sudo scutil --set HostName "HungMac"
sudo scutil --set LocalHostName "HungMac"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "HungMac"

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# I autohide my dock to maximize screen space and hide those distracting red dots on messaging app icons, 
# but the default show and hide is too slow. Speed it up:
defaults write com.apple.dock autohide-time-modifier -float 0.12;killall Dock
defaults write com.apple.Dock autohide-delay -float 0; killall Dock

echo "Done. Note that some of these changes require a logout/restart to take effect."