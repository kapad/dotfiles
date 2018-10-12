#!/bin/bash

cd $HOME/opt
wget -O fasd.zip "https://github.com/clvv/fasd/archive/master.zip"
unzip fasd.zip
mv fasd-master fasd
rm fasd.zip
cd fasd
PREFIX=$HOME make install
