# This file is a helper and will try and load the following files and silently fail if they don't exist. 
# 1. ${HOME}/.work/aliases.zsh
# 2. ${HOME}/.work/functions.zsh
# 3. ${HOME}/.work/completions.zsh

[[ -f ${HOME}/.work/aliases.zsh ]] && source ${HOME}/.work/aliases.zsh || echoerr "Work dotfiles not loaded"
[[ -f ${HOME}/.work/functions.zsh ]] && source ${HOME}/.work/functions.zsh || echoerr "Work dotfiles not loaded"
[[ -f ${HOME}/.work/completions.zsh ]] && source ${HOME}/.work/completions.zsh || echoerr "Work dotfiles not loaded"
