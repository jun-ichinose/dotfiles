# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### sheldon

# source command override technique
function source {
  ensure_zcompiled $1
  builtin source $@
}
function ensure_zcompiled {
  local compiled="$1.zwc"
  if [[ ! -r "$compiled" || "$1" -nt "$compiled" ]]; then
    echo "\033[1;36mCompiling\033[m $1"
    zcompile $1
  fi
}
ensure_zcompiled $ZDOTDIR/.zshrc

source $ZDOTDIR/sync.zsh

# sheldon cache technique
sheldon_cache="$SHELDON_DATA_DIR/sheldon.zsh"
sheldon_lock="$SHELDON_CONFIG_DIR/plugins.lock"
if [[ ! -r "$sheldon_cache" || "$sheldon_lock" -nt "$sheldon_cache" ]]; then
  sheldon source > $sheldon_cache
fi
source "$sheldon_cache"
unset sheldon_cache sheldon_lock

zsh-defer source $ZDOTDIR/lazy.zsh
zsh-defer unfunction source
