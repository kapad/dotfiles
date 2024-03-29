# From https://tech.davis-hansson.com/p/make/
ifeq ($(origin .RECIPEPREFIX), undefined)
  $(error This Make does not support .RECIPEPREFIX. Please use GNU Make 4.0 or later)
endif
.RECIPEPREFIX = >

# this will be the abs path to this Makefile
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
# this will be the pwd for the Makefile
current_dir := $(patsubst %/,%,$(dir $(mkfile_path)))

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

.DEFAULT_GOAL:=help

.PHONY: help
help:
> @echo
> @echo '#############################'
> @echo '#### dotfiles - by kapad ####'
> @echo '#############################'
> @echo 
> @echo 'Usage: '
> @echo 
> @echo 'make: Display this help message'
> @echo 'make help: Display this help message'
> @echo 'make install: Install these dotfiles and their required dependencies - INCOMPLETE'
> @echo 'make link: Create symlinks for all dotfiles and point them to their respective targets in this folder'
> @echo 'make unlink: Delete all symlinks created by "make link"'
> @echo

completions_dir := /usr/local/share/zsh/site-functions
zshd := ${HOME}/.zsh.d
plugins_dir := ${zshd}/plugins
helpers_dir := ${zshd}/helpers

$(call check_defined, HOME, "User's home directory")

.PHONY: install
install: 
	@mkdir -p ${HOME}/bin
	@$(MAKE) -s ${HOME}/bin/cheat
	@$(MAKE) -s link

.PHONY: link-completion
link-completion:
	@ln -sf ${helpers_dir}/completion/cheat.zsh ${completions_dir}/_cheat
	@ln -sf ${helpers_dir}/completion/docker.zsh ${completions_dir}/_docker
	@ln -sf ${helpers_dir}/completion/docker-compose.zsh ${completions_dir}/_docker-compose
	@ln -sf ${helpers_dir}/completion/kubectl.zsh ${completions_dir}/_kubectl
	@echo 'Linked completion scripts'

.PHONY: unlink-completion
unlink-completion:
	@rm -f ${completions_dir}/_cheat
	@rm -f ${completions_dir}/_docker
	@rm -f ${completions_dir}/_docker-compose
	@rm -f ${completions_dir}/_kc
	@rm -f ${completions_dir}/_kubectl
	@echo 'Unlinked completion scripts'

.PHONY: link
link:
	@mkdir -p ${HOME}/.zsh.d
	@echo 'Created ${HOME}/.zsh.d'
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
	@$(MAKE) -s link-completion

.PHONY: unlink
unlink:
	@rm -rf ${zshd}
	@rm -f ${HOME}/.zshrc
	@rm -f ${HOME}/.gitconfig
	@rm -f ${HOME}/.global_gitignore
	@$(MAKE) -s unlink-completion
	@echo "Unlinked/removed all files and directories"

${HOME}/bin/cheat:
	@curl -sL https://github.com/cheat/cheat/releases/download/4.2.2/cheat-darwin-amd64.gz | gunzip -d > ${HOME}/bin/cheat
	@chmod +x ${HOME}/bin/cheat
	@echo "Installed cheat v4.2.2"
