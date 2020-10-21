.DEFAULT_GOAL:=help

.PHONY: help
help:
	@echo
	@echo '#############################'
	@echo '#### dotfiles - by kapad ####'
	@echo '#############################'
	@echo 
	@echo 'Usage: '
	@echo 
	@echo 'make: Display this help message'
	@echo 'make help: Display this help message'
	@echo 'make install (not yet implemented): Install these dotfiles and their required dependencies'
	@echo 'make system-install (not yet implemented): Install all system dependecies (use this to setup a new system from scratch)'
	@echo 'make link: Create symlinks for all dotfiles and point them to their respective targets in this folder'
	@echo 'make unlink: Delete all symlinks created by "make link"'
	@echo 'make configure (not yet implemented): Configure certain system and application preferences.'
	@echo
	@echo

# Check that given variables are set and all have non-empty values,
# die with an error otherwise.
# source: https://stackoverflow.com/a/10858332/1365918
#
# Params:
#   1. Variable name(s) to test.
#   2. (optional) Error message to print.
check_defined = \
	$(strip $(foreach 1,$1, \
	$(call __check_defined,$1,$(strip $(value 2)))))
__check_defined = \
	$(if $(value $1),, \
	$(error Undefined $1$(if $2, ($2))))

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))

$(call check_defined, HOME, User's home directory)

# .PHONY install
# install: 
# 	@#todo

# .PHONY system-install
# system-install:
# 	@#todo

# .PHONY: shell-deps
# shell-deps:
# 	@mkdir -p ${HOME}/bin
# 	@curl -L git.io/antigen > ${HOME}/bin/antigen.zsh
# 	@echo "Installed antigen"

.PHONY: link
link:
	@ln -sf ${current_dir}/shell/zshrc ${HOME}/.zshrc
	@echo 'Created ${HOME}/.zshrc'
	@ln -sf ${current_dir}/shell/functions ${HOME}/.functions
	@echo 'Created ${HOME}/.functions'
	@ln -sf ${current_dir}/shell/aliases ${HOME}/.aliases
	@echo 'Created ${HOME}/.aliases'
	@ln -sf ${current_dir}/shell/plugins ${HOME}/.plugins
	@echo 'Created ${HOME}/.plugins'
	@ln -sf ${current_dir}/shell/helpers ${HOME}/.helpers
	@echo 'Created ${HOME}/.helpers'

.PHONY: unlink
unlink:
	@rm -f ${HOME}/.zshrc
	@rm -f ${HOME}/.functions
	@rm -f ${HOME}/.aliases
	@rm -f ${HOME}/.plugins
	@rm -f ${HOME}/.helpers
	@echo "Unlinked all files"

# .PHONY: configure
# configure:
# 	@#todo


# ifeq ($(strip $(HOME)),)
# 	HOME:=
# endif
