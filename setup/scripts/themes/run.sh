#!/bin/bash

if [[ ! -d $HOME/.themes ]]; then
	mkdir $HOME/.themes
fi

./ant.sh
./materia.sh
./paper.sh
./pop.sh

