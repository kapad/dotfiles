#!/bin/bash

# https://confluence.jetbrains.com/display/IDEADEV/Inotify+Watches+Limit
# When using multiple applications like Sublime Merge, Idea, vscode, the applicaitons don't work correctly at 
# times. Possibly because of this limit. 

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
. $BASE_DIR/../lib.sh
as_root "$0" "$@"

cat <<END >> /etc/sysctl.conf

###################################################################
# inotify - max user watches. 
# 
# The number of open file descriptors that can watch the file 
# system for any changes. 
# https://confluence.jetbrains.com/display/IDEADEV/Inotify+Watches+Limit
fs.inotify.max_user_watches = 524288
END
