#!/bin/bash

wget -O $HOME/tmp/pop.zip "https://github.com/pop-os/gtk-theme/archive/3.1.2.zip"
unzip $HOME/tmp/pop.zip -d $HOME/tmp/
rm $HOME/tmp/pop.zip
cd $HOME/tmp/gtk-theme-3.1.2
make gtk2 gtk3 gnome-shell
make install BASE_DIR=$HOME/.local/share/themes
rm -rf $HOME/tmp/gtk-theme-3.1.2
