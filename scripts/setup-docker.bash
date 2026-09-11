#!/usr/bin/env bash
set -eux

# shellcheck disable=SC1091
source "$(dirname "$0")/common.bash"

[ "$(uname)" != "Darwin" ] && exit 0

if ! type brew >/dev/null 2>&1; then
  echo "Homebrew is not installed. Skip Docker Buildx plugin setup."
  exit 0
fi

if ! brew list docker-buildx >/dev/null 2>&1; then
  echo "docker-buildx is not installed. Skip Docker Buildx plugin setup."
  exit 0
fi

DOCKER_CONFIG_DIR="${DOCKER_CONFIG:-$XDG_CONFIG_HOME/docker}"
DOCKER_BUILDX_SRC="$(brew --prefix)/opt/docker-buildx/bin/docker-buildx"
DOCKER_BUILDX_DST="$DOCKER_CONFIG_DIR/cli-plugins/docker-buildx"

mkdir -p "$DOCKER_CONFIG_DIR/cli-plugins"

ln -sfnv "$DOCKER_BUILDX_SRC" "$DOCKER_BUILDX_DST"
chmod +x "$DOCKER_BUILDX_SRC"

docker buildx version
