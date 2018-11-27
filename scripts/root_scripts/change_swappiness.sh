#!/bin/bash

cat <<END >> /etc/sysctl.conf

###################################################################
# Swappiness. 
# 
# The default for ubuntu is 60 which is much too high for systems with a large 
# amount of RAM. This laptop has 16GB. 
vm.swappiness = 10
END
