### locale
export LANG="ja_JP.UTF-8"

# ignore /etc/zprofile, /etc/zshrc, /etc/zlogin, and /etc/zlogout
setopt no_global_rcs

### XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

### zsh (same config is written in /etc/zshenv for macOS)
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

### gnupg
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

### rust
export RUST_BACKTRACE=1
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

### golang
export GOPATH="$XDG_DATA_HOME/go"

### deno
export DENO_INSTALL="$XDG_DATA_HOME/deno"
export DENO_INSTALL_ROOT="$DENO_INSTALL"

### ruby
# export GEM_HOME="$XDG_DATA_HOME/gem"
# export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
#
# export BUNDLE_USER_HOME="$XDG_CONFIG_HOME/bundle"
# export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
# export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle/plugin"

### sheldon
export SHELDON_CONFIG_DIR="$XDG_CONFIG_HOME/sheldon"
export SHELDON_DATA_DIR="$XDG_DATA_HOME/sheldon"

### docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
