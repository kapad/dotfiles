#!/bin/bash

. ../lib.sh

as_root "$0" "$@"

snap install --classic skype
snap install --classic sublime-text
snap install --classic vscode
snap install --classic atom
snap install pdftk
