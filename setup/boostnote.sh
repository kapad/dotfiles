#!/bin/bash

# currently, there's no easy way to script the install for boostnote. 
# releases aren't tagged in the github repo, so can't parse the GH API and 
# get the latest release. Also, the website download url, is linked to the version, 
# so any script using that link will be locked to that given version. 

# for now, simply open the boostnote download page in a browser. 
xdg-open "https://boostnote.io/#download"