#!/bin/bash

. ../lib.sh

as_root "$0" "$@"

add-apt-repository ppa:dyatlov-igor/materia-theme
apt-get update
apt-get install -y materia-gtk-theme
