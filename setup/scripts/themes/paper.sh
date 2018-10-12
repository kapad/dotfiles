#!/bin/bash

. ../lib.sh

as_root "$0" "$@"

add-apt-repository -y ppa:snwh/ppa
apt-get update
apt-get install -y paper-icon-theme
