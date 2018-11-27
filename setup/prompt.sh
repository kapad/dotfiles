#!/bin/bash

cd $HOME/opt
wget -O liquidprompt.zip "https://github.com/nojhan/liquidprompt/archive/master.zip"
unzip liquidprompt.zip
mv liquidprompt-master liquidprompt
rm liquidprompt.zip
