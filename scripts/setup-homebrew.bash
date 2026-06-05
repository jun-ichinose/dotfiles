#!/usr/bin/env bash
set -x
# shellcheck disable=SC1091
source "$(dirname "$0")/common.bash"

[ "$(uname)" != "Darwin" ] && exit
[ -n "$SKIP_HOMEBREW" ] && exit

if type brew >/dev/null; then
    echo "Homebrew is already installed."
else
    echo "Installing Homebrew..."
    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

if ! type brew >/dev/null 2>&1; then
    echo "ERROR: brew command not found after Homebrew installation."
    exit 1
fi

echo "Updating Homebrew..."
brew update

echo "Installing Homebrew apps..."
brew bundle install --file "${REPO_DIR}/config/homebrew/Brewfile" --verbose

true
