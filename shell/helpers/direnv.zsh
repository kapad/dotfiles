_direnv_hook() {
  trap -- '' SIGINT;
  # redirect the STDERR so that powerlevel10k instant prompt doesn't complain.
  eval "$("/usr/local/bin/direnv" export zsh 2>/dev/null)";
  trap - SIGINT;
}
typeset -ag precmd_functions;
if [[ -z ${precmd_functions[(r)_direnv_hook]} ]]; then
  precmd_functions=( _direnv_hook ${precmd_functions[@]} )
fi
typeset -ag chpwd_functions;
if [[ -z ${chpwd_functions[(r)_direnv_hook]} ]]; then
  chpwd_functions=( _direnv_hook ${chpwd_functions[@]} )
fi
