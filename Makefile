.DEFAULT_GOAL:=help

.PHONY: help isntall system-install link unlink configure

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
	@echo 'make install: Install these dotfiles and their required dependencies'
	@echo 'make system-install: Install all system dependecies (use this to setup a new system from scratch)'
	@echo 'make link: Create symlinks for all dotfiles and point them to their respective targets in this folder'
	@echo 'make unlink: Delete all symlinks created by "make link"'
	@echo 'make configure: Configure certain system and application preferences.'
	@echo
	@echo

install: 
	@#todo

system-install:
	@#todo

link:
	@#todo

unlink:
	@#todo

configure:
	@#todo
