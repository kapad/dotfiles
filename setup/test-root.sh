#!/bin/bash

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
. $BASE_DIR/lib.sh
as_root "$0" "$USER"

echo $1
