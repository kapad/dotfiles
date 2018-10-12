#!/bin/bash

. ../lib.sh

as_root "$0" "$@"

apt-get install -y apt-transport-https

# use the mirror at kernel.org which is over https. 
# Prevents the issue where a hash sum mismatch error is caused by some broken 
# caching by a stupid ISP. 
sed -i 's;^deb.*ubuntu\.com;deb https://mirrors.kernel.org;g' /etc/apt/sources.list

# often on new systems, the apt-get update command may see hash sum mismatch errors. 
# running the following will hopefully prevent against these. 
rm -rf /var/lib/apt/lists/*
apt-get clean

# update the source files
apt-get update
