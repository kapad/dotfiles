#!/bin/bash

wget -O $HOME/tmp/materia.zip "https://github.com/nana-4/materia-theme/archive/master.zip"
unzip $HOME/tmp/materia.zip -d $HOME/tmp/
rm $HOME/tmp/materia.zip
$HOME/tmp/materia-theme-master/install.sh --dest $HOME/.local/share/themes
rm -rf $HOME/tmp/materia-theme-master
