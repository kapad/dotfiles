#!/bin/bash

cd $HOME/opt
wget -O git-scripts.zip "https://github.com/jwiegley/git-scripts/archive/master.zip"
unzip git-scripts.zip
mv git-scripts-master git-scripts
rm git-scripts.zip
