#!/bin/bash

# Some command line documentation tools. 
# These docs are generally more concise than man pages and are great for quickly looking 
# up the exact syntax of a command. For detailed documentation on any tool there's always
# the man page, and online sources. 

# This script installs the following: 
# 1. cheat (https://github.com/cheat/cheat)
# 2. eg (https://github.com/srsudar/eg)
# 3. tldr (https://github.com/raylee/tldr)

pip install --user cheat eg

curl -o $HOME/bin/tldr "https://raw.githubusercontent.com/raylee/tldr/master/tldr"
chmod +x $HOME/bin/tldr

# TODO create repos for cheats and eg. 
# TODO seed these repos
# TODO .egrc https://github.com/srsudar/eg#configuration-and-extension