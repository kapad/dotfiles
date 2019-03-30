#!/bin/bash

# for systems with an SSD, and a large amount of RAM, ideally, the system memory should be sufficient for most tasks. 
# the default swappines value of 60 in ubuntu, ends up using the swap space even if there's a lot of memory free. 
# also, using swap on an SSD, leads to many read-write cycles on the SSD and will eventually damage the SSD. 

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
