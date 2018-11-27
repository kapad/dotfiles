#!/bin/bash

pip install --user cheat
pip install --user eg

curl -o $HOME/bin/tldr "https://raw.githubusercontent.com/raylee/tldr/master/tldr"
chmod +x $HOME/bin/tldr