#!/bin/bash

. ../lib.sh

as_root "$0" "$@"

./packages.sh
./snaps.sh
./calibre.sh
