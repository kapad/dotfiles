#!/bin/bash

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
. $BASE_DIR/../lib.sh
as_root "$0" "$@"

wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin
