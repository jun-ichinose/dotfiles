#!/usr/bin/env bash
set -x
# shellcheck disable=SC1091
source "$(dirname "$0")/common.bash"

[ "$(uname)" != "Darwin" ] && exit

# Close open System Preferences panes, to prevent them from overriding settings.
osascript -e 'tell application "System Preferences" to quit'

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Global
defaults write -g AppleScrollerPagingBehavior -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Finder
defaults write com.apple.finder AppleShowAllFiles -bool true  # Show all filename extensions in Finder.
defaults write com.apple.finder ShowPathbar -bool true        # Show path bar.
defaults write com.apple.finder ShowRecentTags -bool false
defaults write com.apple.finder ShowTabView -bool true
defaults write com.apple.finder ShowSidebar -bool true
defaults write com.apple.finder ShowStatusBar -bool true      # Show status bar.
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Downloads/" # Set the desktop as the default location for new finder windows.

# Set search scope.
# This Mac       : `SCev`
# Current Folder : `SCcf`
# Previous Scope : `SCsp`
defaults write com.apple.finder FXDefaultSearchScope SCcf

# Set preferred view style.
# Icon View   : `icnv`
# List View   : `Nlsv`
# Column View : `clmv`
# Cover Flow  : `Flwv`
defaults write com.apple.finder FXPreferredViewStyle clmv
rm -rf ~/.DS_Store

# Set default path for new windows.
# Computer     : `PfCm`
# Volume       : `PfVo`
# $HOME        : `PfHm`
# Desktop      : `PfDe`
# Documents    : `PfDo`
# All My Files : `PfAF`
# Other…       : `PfLo`
defaults write com.apple.finder NewWindowTarget -string PfHm

# Keyboard
defaults write NSGlobalDomain KeyRepeat -int 3                      # キーリピートの速度（押し続けたときの反復間隔）を高速に設定する
defaults write NSGlobalDomain InitialKeyRepeat -int 20              # キーリピート開始までの待機時間を短く設定する
defaults write NSAutomaticSpellingCorrectionEnabled -bool false     # 入力時の自動スペル修正を無効化する
defaults write WebAutomaticSpellingCorrectionEnabled -bool false    # Web入力エリアでの自動スペル修正を無効化する
defaults write NSAutomaticPeriodSubstitutionEnabled -bool false     # ダブルスペースでピリオド変換する機能を無効化する
defaults write NSAutomaticDashSubstitutionEnabled -bool false       # 入力時のダッシュへの自動変換を無効化する
defaults write NSAutomaticQuoteSubstitutionEnabled -bool false      # 入力時のクォート（引用符）の自動変換を無効化する

# Dock
# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Don’t group windows by application in Mission Control
# (i.e. use the old Exposé behavior instead)
defaults write com.apple.dock expose-group-by-app -bool false

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0
# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

defaults write com.apple.dock magnification -bool false
defaults write com.apple.dock springboard-columns -int 9
defaults write com.apple.dock springboard-rows -int 7
defaults write com.apple.dock ResetLaunchPad -bool true
defaults write com.apple.dock show-process-indicators -bool true

# Hot corners 
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen
# Top left screen corner → Mission Control
defaults write com.apple.dock wvous-tl-corner -int 2
defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner → Desktop
defaults write com.apple.dock wvous-tr-corner -int 4
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner → Start screen saver
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

# Menubar
defaults write com.apple.controlcenter BatteryShowPercentage -bool false
defaults write com.apple.menuextra.clock ShowSeconds -bool true

# Mission Control
defaults write com.apple.dock mru-spaces -bool false # Don't automatically rearrange spaces

# Disable .DS_Store on network disks
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Screen capture
mkdir -p "${HOME}/Screenshots"
defaults write com.apple.screencapture location -string "${HOME}/Screenshots"

defaults write com.apple.screencapture name ""
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture type -string "png"

# Text correction
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false      # Disable automatic capitalization.
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false  # Disable peroid substitution.
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false   # Disable smart quotes.
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false    # Disable smart dashes.
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false  # Disable auto-correct.
defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false      # Disable text-completion.

# To enable key-repeating
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false        # For VS Code

# Safari & WebKit
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

killall Dock
killall Finder
killall SystemUIServer
