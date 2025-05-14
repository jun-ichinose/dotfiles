#!/usr/bin/env bash
set -x
# shellcheck disable=SC1091
source "$(dirname "$0")/common.bash"

[[ -n "$SKIP_GHRED" ]] && exit

export PATH="$DENO_INSTALL/bin:$PATH"

echo "Installing gh-red..."
curl -fsSL https://raw.githubusercontent.com/NagayamaRyoga/gh-red/main/install.bash | /bin/bash

"$XDG_DATA_HOME/gh-red/bin/gh-red"
