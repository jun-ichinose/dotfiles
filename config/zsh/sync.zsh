### path

# unique path
typeset -gU PATH path

path=(
  /usr/local/bin(N-/)
  /usr/bin
  /bin
  /usr/local/sbin(N-/)
  /usr/sbin
  /sbin
)

path=(
  "$HOME/.local/bin"(N-/)
  "$GOPATH/bin"(N-/)
  "$DENO_INSTALL/bin"(N-/)
  "$path[@]"
)

# export homebrew env
eval "$(/opt/homebrew/bin/brew shellenv zsh)"
eval "$(sheldon source)"
eval "$(zsh-defer init --global)"

### history
export HISTFILE="$XDG_STATE_HOME/zsh_history"
export HISTSIZE=10000
export SAVEHIST=100000

setopt extended_history
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
setopt inc_append_history_time

### options

# cd options
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_to_home

# no beep
setopt no_beep
setopt no_list_beep
setopt no_hist_beep

# misc
setopt rm_star_wait      # confirm rm star
setopt ignore_eof        # disable ^d (use 'exit', 'logout')
setopt magic_equal_subst # enable to expand ~ after = e.g.) --prefix=~/local
setopt no_case_glob      # ignore case when glob
setopt extended_glob     # use '*, ~, ^' as regular expression
setopt auto_remove_slash # automatically delete slash complemented by supplemented by inserting a space
setopt mark_dirs         # if the path is directory, add '/' to path tail when generating path by glob
setopt print_eight_bit   # support japanese file name
setopt no_flow_control   # disable ^s

### hooks

# do not add common commands to history
zshaddhistory() {
  local line="${1%%$'\n'}"
  [[ ! "$line" =~ "^(cd|history|ls|ll|la)($| )" ]]
}

# ls when cd
chpwd() {
  if (( ${+commands[eza]} )); then
    eza --icons --git -a --group-directories-first
  else
    ls -a
  fi
}

### keybindings
bindkey -e
