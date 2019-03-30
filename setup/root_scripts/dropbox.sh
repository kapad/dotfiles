#!/bin/bash

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
. $BASE_DIR/../lib.sh
as_root "$0" "$@"

# this package is the dropbox installer, which then downloads and installs the latest version of dropbox. 
# therefore, though it's a package released in 2015, it should be safe to use in a script. 
wget -O /tmp/dropbox.deb "https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb"
dpkg -i /tmp/dropbox.deb
rm /tmp/dropbox.deb