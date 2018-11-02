#!/bin/bash

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
. $BASE_DIR/../lib.sh
as_root "$0" "$@"

# multiple classic snaps cannot be installed in a single command. 
snap install --classic skype
snap install --classic sublime-text
snap install --classic vscode
snap install --classic atom

snaps_list=(
    pdftk
    chromium # prefer using to google chrome which tracks the shit out of you.
    inkscape # required to compile the pop theme from source.
)
snap install "${snaps_list[@]}"
