#!/bin/bash

# python is installed by default in Ubuntu. 
# root_scripts/packages installs "python-pip" and "python3-pip"
# For development though, it's best to have pyenv or virtualenv installed and to then 
# create individual envs for every project. 
# This script only installs virtualenv, virtualenv-wrapper and pyenv. For every project, 
# the env for that project has to be created manually. 

pkg_list=(
	pipenv
	virtualenv
	virtualenvwrapper
)

pip install --user "${pkg_list[@]}"

curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
