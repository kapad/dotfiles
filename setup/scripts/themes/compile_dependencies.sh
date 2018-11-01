#!/bin/bash

. ../lib.sh

as_root "$0" "$@"

# For compiling themes (pop gtk-theme)
# removed inkscape from the below and installing it via snap

apt-get update
apt-get install -y \
    libtool pkg-config sassc optipng parallel libglib2.0-dev libgdk-pixbuf2.0-dev librsvg2-dev libxml2-utils

snap install inkscape
