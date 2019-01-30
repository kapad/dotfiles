#!/bin/bash

./dirs.sh

root_scripts/change_swappiness.sh
root_scripts/packages.sh
root_scripts/calibre.sh
root_scripts/google-chrome.sh
root_scripts/dropbox.sh

./node.sh
./python.sh
./ruby.sh

./appimage.sh
./boostnote.sh
./cli-doc-tools.sh
./docker-compose.sh
./fasd.sh
./git-scripts.sh
./keepassxc.sh
./mdv.sh
./nixnote.sh
./prompt.sh

./gnome-extensions.sh

themes/ant.sh
themes/materia.sh
themes/paper.sh

# ./gsettings.sh
