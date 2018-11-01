#!/bin/bash

# . ../lib.sh

# as_root "$0" "$@"

# add-apt-repository -y ppa:system76/pop
# apt-get update
# apt-get install -y pop-theme

wget -O $HOME/tmp/pop.zip "https://github.com/pop-os/gtk-theme/archive/3.1.2.zip"
unzip $HOME/tmp/pop.zip -d $HOME/tmp/
rm $HOME/tmp/pop.zip
cd $HOME/tmp/gtk-theme-3.1.2
BASE_DIR=$HOME/.local/share/themes make install
