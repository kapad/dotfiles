#!/bin/bash

./dirs.sh

root_scripts/run.sh

./appimage.sh
./fasd.sh
./gnome-extensions.sh
./keepassxc.sh
./prompt.sh

themes/run.sh

./gsettings.sh
