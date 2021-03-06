# zsh command mode completion
# TODO stop using old style completion here.
# I've commented out the old style completion, so that atleast the jumping around and word 
# mode completion can be used until I fix this.
# _fasd_zsh_cmd_complete() {
#   local compl
#   read -c compl
#   (( $+compstate )) && compstate[insert]=menu # no expand if compsys loaded
#   reply=(${(f)"$(fasd --complete "$compl")"})
# }

# # enbale command mode completion
# compctl -U -K _fasd_zsh_cmd_complete -V fasd -x 'C[-1,-*e],s[-]n[1,e]' -c - \
#   'c[-1,-A][-1,-D]' -f -- fasd fasd_cd

(( $+functions[compdef] )) && {
  # zsh word mode completion
  _fasd_zsh_word_complete() {
    [ "$2" ] && local _fasd_cur="$2"
    [ -z "$_fasd_cur" ] && local _fasd_cur="${words[CURRENT]}"
    local fnd="${_fasd_cur//,/ }"
    local typ=${1:-e}
    # todo - consider patching this to use fzf
    fasd --query $typ "$fnd" 2>> "/dev/null" | \
      sort -nr | sed 's/^[^ ]*[ ]*//' | while read -r line; do
        compadd -U -V fasd "$line"
      done
    compstate[insert]=menu # no expand
  }
  _fasd_zsh_word_complete_f() { _fasd_zsh_word_complete f ; }
  _fasd_zsh_word_complete_d() { _fasd_zsh_word_complete d ; }
  _fasd_zsh_word_complete_trigger() {
    local _fasd_cur="${words[CURRENT]}"
    eval $(fasd --word-complete-trigger _fasd_zsh_word_complete $_fasd_cur)
  }
  # define zle widgets
  zle -C fasd-complete complete-word _generic
  zstyle ':completion:fasd-complete:*' completer _fasd_zsh_word_complete
  zstyle ':completion:fasd-complete:*' menu-select

  zle -C fasd-complete-f complete-word _generic
  zstyle ':completion:fasd-complete-f:*' completer _fasd_zsh_word_complete_f
  zstyle ':completion:fasd-complete-f:*' menu-select

  zle -C fasd-complete-d complete-word _generic
  zstyle ':completion:fasd-complete-d:*' completer _fasd_zsh_word_complete_d
  zstyle ':completion:fasd-complete-d:*' menu-select
}

(( $+functions[compdef] )) && {
  # enable word mode completion
  orig_comp="$(zstyle -L ':completion:\*' completer 2>> "/dev/null")"
  if [ "$orig_comp" ]; then
    case $orig_comp in
      *_fasd_zsh_word_complete_trigger*);;
      *) eval "$orig_comp _fasd_zsh_word_complete_trigger";;
    esac
  else
    zstyle ':completion:*' completer _complete _fasd_zsh_word_complete_trigger
  fi
  unset orig_comp
}

# add zsh hook
_fasd_preexec() {
  { eval "fasd --proc $(fasd --sanitize $1)"; } >> "/dev/null" 2>&1
}
autoload -Uz add-zsh-hook
add-zsh-hook preexec _fasd_preexec

# shortcuts
bindkey '^F^F' fasd-complete    # C-f C-f to do fasd-complete (files and directories)

# fasd_cd: ripped from the output of "fasd --init posix-alias". 
# Customised here. 
# TODO maybe try and change this to plug in fzf or fzf-tab
fasd_cd() {
  if [ $# -le 1 ]; then
    fasd "$@"
  else
    local _fasd_ret="$(fasd -e 'printf %s' "$@")"
    [ -z "$_fasd_ret" ] && return
    [ -d "$_fasd_ret" ] && cd "$_fasd_ret" || printf %s\n "$_fasd_ret"
  fi
}

# function to generate fasd init code
# WARN: Do not replace this init file with the output of the init code. Instead, replace the relevant parts.
fasd_gen_init() {
    # fasd --init zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install zsh-hook
    # disable command mode completion for now.
    fasd --init zsh-wcomp zsh-wcomp-install zsh-hook
}
