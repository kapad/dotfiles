#!/bin/bash

wget -O $HOME/tmp/paper.zip "https://github.com/snwh/paper-icon-theme/archive/master.zip"
unzip $HOME/tmp/paper.zip -d $HOME/tmp/
rm $HOME/tmp/paper.zip
cp -r $HOME/tmp/paper-icon-theme-master/Paper $HOME/.local/share/icons
rm -rf $HOME/tmp/paper-icon-theme-master
