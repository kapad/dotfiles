#!/bin/bash

if [ ! -d $HOME/bin ]; then
  mkdir $HOME/bin
fi

if [ ! -d $HOME/.local/bin ]; then
  mkdir -p $HOME/.local/bin
fi

if [[ ! -d $HOME/opt ]]; then
    mkdir $HOME/opt
fi

if [[ ! -d $HOME/Applications ]]; then
    mkdir $HOME/Applications
fi