#!/bin/bash

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
. $BASE_DIR/../lib.sh
as_root "$0" "$@"

# calibre has a simple installer script that is version agnostic. 
# the downside IMO is using sudo for a third party installation script. 
wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin
