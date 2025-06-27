#!/usr/bin/env bash
set -eux
# shellcheck disable=SC1091
source "$(dirname "$0")/common.bash"

/bin/bash "$CUR_DIR/setup-apt.bash"
/bin/bash "$CUR_DIR/setup-homebrew.bash"
/bin/bash "$CUR_DIR/setup-links.bash"
/bin/bash "$CUR_DIR/setup-mac.bash"
/bin/bash "$CUR_DIR/setup-deno.bash"
/bin/bash "$CUR_DIR/setup-dein.bash"
