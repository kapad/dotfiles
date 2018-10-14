#!/bin/bash

wget -O $HOME/tmp/ant.zip "https://github.com/EliverLara/Ant/archive/master.zip"
unzip $HOME/tmp/ant.zip -d $HOME/tmp/
rm $HOME/tmp/ant.zip
mv $HOME/tmp/Ant-master $HOME/.themes/Ant
