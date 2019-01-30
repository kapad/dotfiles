#!/bin/bash

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
. $BASE_DIR/../lib.sh
as_root "$0" "$@"

cat <<END >> /etc/sysctl.conf

###################################################################
# Swappiness. 
# 
# The default for ubuntu is 60 which is much too high for systems with a large 
# amount of RAM. This laptop has 16GB. 
vm.swappiness = 10
END
