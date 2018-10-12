#!/bin/bash

wget -O $HOME/.local/bin/gnome-shell-extension-installer \
    "https://raw.githubusercontent.com/brunelli/gnome-shell-extension-installer/master/gnome-shell-extension-installer"
chmod a+x $HOME/.local/bin/gnome-shell-extension-installer

$HOME/.local/bin/gnome-shell-extension-installer --yes 19 # user themes
$HOME/.local/bin/gnome-shell-extension-installer --yes 964 # do not disturb button
$HOME/.local/bin/gnome-shell-extension-installer --yes 36 # lock keys
$HOME/.local/bin/gnome-shell-extension-installer --yes 1276 # night light slider
$HOME/.local/bin/gnome-shell-extension-installer --yes 826 # suspend button
