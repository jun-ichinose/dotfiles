#!/usr/bin/env bash
set -x
## shellcheck ./scripts/common.bash
source "$(dirname "$0")/common.bash"

[ "$(uname)" != "Darwin" ] && exit

# Close open System Preferences panes, to prevent them from overriding settings.
osascript -e 'tell application "System Preferences" to quit'

# Global
defaults write -g AppleScrollerPagingBehavior -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

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
defaults write NSAutomaticCapitalizationEnabled -bool false         # 自動大文字変換（文頭などの大文字化）を無効化する
defaults write NSAutomaticPeriodSubstitutionEnabled -bool false     # ダブルスペースでピリオド変換する機能を無効化する
defaults write NSAutomaticDashSubstitutionEnabled -bool false       # 入力時のダッシュへの自動変換を無効化する
defaults write NSAutomaticQuoteSubstitutionEnabled -bool false      # 入力時のクォート（引用符）の自動変換を無効化する

# Dock
defaults write com.apple.dock autohide -bool false
defaults write com.apple.dock magnification -bool false
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock springboard-columns -int 9
defaults write com.apple.dock springboard-rows -int 7
defaults write com.apple.dock ResetLaunchPad -bool true

# Menubar
defaults write com.apple.menuextra.battery ShowPercent -bool true
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM HH:mm:ss"  # Set clock format.

# Mission Control
defaults write com.apple.dock mru-spaces -bool false # Don't automatically rearrange spaces

# Disable .DS_Store on network disks
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Screen capture
defaults write com.apple.screencapture name ""
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture type -string "png"

# Text correction
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false      # Disable automatic capitalization.
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false  # Disable peroid substitution.
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false   # Disable smart quotes.
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false    # Disable smart dashes.
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false      # Disable automatic capitalization.
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false  # Disable auto-correct.
defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false      # Disable text-completion.

# To enable key-repeating
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false        # For VS Code

killall Dock
killall Finder
killall SystemUIServer
