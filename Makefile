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

completions_dir := /usr/local/share/zsh/site-functions
plugins_dir := ${HOME}/.plugins
helpers_dir := ${HOME}/.helpers

$(call check_defined, HOME, "User's home directory")

.PHONY: install
install: 
	@$(MAKE) -s ${HOME}/bin/cheat

# .PHONY system-install
# system-install:
# 	@#todo

# .PHONY: shell-deps
# shell-deps:
# 	@mkdir -p ${HOME}/bin
# 	@curl -L git.io/antigen > ${HOME}/bin/antigen.zsh
# 	@echo "Installed antigen"

.PHONY: link-completion
link-completion:
	@ln -sf ${helpers_dir}/completion/cheat.zsh ${completions_dir}/_cheat
	@ln -sf ${helpers_dir}/completion/docker.zsh ${completions_dir}/_docker
	@ln -sf ${helpers_dir}/completion/docker-compose.zsh ${completions_dir}/_docker-compose
	@ln -sf ${plugins_dir}/kc/completion/kc.zsh ${completions_dir}/_kc
	@ln -sf ${helpers_dir}/completion/kubectl.zsh ${completions_dir}/_kubectl
	@ln -sf ${helpers_dir}/completion/sledge.zsh ${completions_dir}/_sledge
	@echo 'Linked completion scripts'

.PHONY: link
link:
	@ln -sf ${current_dir}/shell/zshrc ${HOME}/.zshrc
	@echo 'Created ${HOME}/.zshrc'
	@ln -sf ${current_dir}/shell/plugins ${plugins_dir}
	@echo 'Created ${plugins_dir}'
	@ln -sf ${current_dir}/shell/helpers ${helpers_dir}
	@echo 'Created ${helpers_dir}'
	@ln -sf ${current_dir}/git/gitconfig ${HOME}/.gitconfig
	@echo 'Created ${HOME}/.gitconfig'
	@ln -sf ${current_dir}/git/global_gitignore ${HOME}/.global_gitignore
	@echo 'Created ${HOME}/.global_gitignore'
# 	@ln -sf ${plugins_dir}/helmenv ${HOME}/.helmenv
# 	@echo 'Created ${HOME}/.helmenv'
	@$(MAKE) -s link-completion

.PHONY: unlink
unlink:
	@rm -f ${HOME}/.zshrc
	@rm -f ${HOME}/.plugins
	@rm -f ${HOME}/.helpers
	@rm -f ${HOME}/.gitconfig
	@rm -f ${HOME}/.global_gitignore
	@echo "Unlinked all files"

${HOME}/bin/cheat:
	@curl -sL https://github.com/cheat/cheat/releases/download/4.1.1/cheat-darwin-amd64.gz | gunzip -d > ${HOME}/bin/cheat
	@chmod +x ${HOME}/bin/cheat
	@echo "Installed cheat v4.1.1"

# .PHONY: configure
# configure:
# 	@#todo


# ifeq ($(strip $(HOME)),)
# 	HOME:=
# endif
