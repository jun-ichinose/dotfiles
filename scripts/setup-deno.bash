#!/usr/bin/env bash
set -x
# shellcheck disable=SC1091
source "$(dirname "$0")/common.bash"

[ -n "$SKIP_DENO" ] && exit

echo "Installing Deno..."
curl -fsSL https://deno.land/x/install/install.sh | CI=1 /bin/sh

echo "Install Deno completions..."
mkdir -p "$ZDOTDIR/completions"
"$DENO_INSTALL/bin/deno" completions zsh >"$ZDOTDIR/completions/_deno.zsh"
