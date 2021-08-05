# This file is a helper and will try and load the following files and silently fail if they don't exist. 
# 1. ${HOME}/.work/aliases.zsh
# 2. ${HOME}/.work/functions.zsh
# 3. ${HOME}/.work/completions.zsh

[[ -f ${WORK_DOTFILES_DIR}/zshrc ]] && source ${WORK_DOTFILES_DIR}/zshrc || echoerr "Work dotfiles not loaded"
[[ -f ${WORK_DOTFILES_DIR}/aliases.zsh ]] && source ${WORK_DOTFILES_DIR}/aliases.zsh || echoerr "Work dotfiles not loaded"
[[ -f ${WORK_DOTFILES_DIR}/functions.zsh ]] && source ${WORK_DOTFILES_DIR}/functions.zsh || echoerr "Work dotfiles not loaded"
