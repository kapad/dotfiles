#!/bin/bash

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
. $BASE_DIR/../lib.sh
as_root "$0" "$@"

wget -O /tmp/google-chrome-stable_current_amd64.deb "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
dpkg -i /tmp/google-chrome-stable_current_amd64.deb
rm /tmp/google-chrome-stable_current_amd64.deb
