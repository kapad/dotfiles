#!/bin/bash

. ../lib.sh

as_root "$0" "$@"

add-apt-repository -y ppa:system76/pop
apt-get update
apt-get install -y pop-theme
