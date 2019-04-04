#!/bin/bash

# From the fasd README
# ====================
# Fasd (pronounced similar to "fast") is a command-line productivity booster. 
# Fasd offers quick access to files and directories for POSIX shells. It is inspired by tools like autojump, z and v. 
# Fasd keeps track of files and directories you have accessed, so that you can quickly reference them in the command line.

# Fasd ranks files and directories by "frecency," that is, by both "frequency" and "recency." 
# The term "frecency" was first coined by Mozilla and used in Firefox (link).

# Homepage: https://github.com/clvv/fasd

# fasd also needs some initialization code that needs to be added to .bashrc. This gets printed when it installs. 

# Also, I've added some aliases to make jumping easier.
# alias a='fasd -a'        # any
# alias s='fasd -si'       # show / search / select
# alias d='fasd -d'        # directory
# alias f='fasd -f'        # file
# alias sd='fasd -sid'     # interactive directory selection
# alias sf='fasd -sif'     # interactive file selection
# alias z='fasd_cd -d'     # cd, same functionality as j in autojump
# alias zz='fasd_cd -d -i' # cd with interactive selection
# alias j='fasd_cd -d'     # cd, same functionality as j in autojump


cd $HOME/opt
wget -O fasd.zip "https://github.com/clvv/fasd/archive/master.zip"
unzip fasd.zip
mv fasd-master fasd
rm fasd.zip
cd fasd
PREFIX=$HOME make install
