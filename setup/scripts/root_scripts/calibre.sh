#!/bin/bash

. ../lib.sh

as_root "$0" "$@"

wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin
