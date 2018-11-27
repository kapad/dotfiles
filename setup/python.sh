#!/bin/bash

pkg_list=(
	pipenv
	virtualenv
	virtualenvwrapper
)

pip install --user "${pkg_list[@]}"

curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
