#!/bin/bash

if [[ ! -d $HOME/.themes ]]; then
	mkdir $HOME/.themes
fi
cd $HOME/.themes

./ant.sh
./materia.sh
./paper.sh
./run.sh

