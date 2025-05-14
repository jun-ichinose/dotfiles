#!/usr/bin/env bash
# shellcheck shell=bash
set -x
source "$(dirname "$0")/common.bash"

if [ ! -d "$HOME/.ssh" ]; then
    mkdir -p "$HOME/.ssh"
    chmod 700 "$HOME/.ssh"
fi

mkdir -p \
    "$XDG_CONFIG_HOME" \
    "$XDG_STATE_HOME" \
    "$XDG_DATA_HOME/vim" \
    "$XDG_DATA_HOME/sheldon"

if [ ! -d "$XDG_DATA_HOME/gnupg" ]; then
    mkdir -p "$XDG_DATA_HOME/gnupg"
    chmod 700 "$XDG_DATA_HOME/gnupg"
fi

ln -sfv "$REPO_DIR/config/"* "$XDG_CONFIG_HOME"
ln -sfv "$XDG_CONFIG_HOME/zsh/.zshenv" "$HOME/.zshenv"
ln -sfv "$XDG_CONFIG_HOME/editorconfig/.editorconfig" "$HOME/.editorconfig"
ln -sfnv "$XDG_DATA_HOME/vim" "$HOME/.vim"
