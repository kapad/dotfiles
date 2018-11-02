#!/bin/bash

wget -O $HOME/tmp/appimaged-x86_64.AppImage \
    "https://github.com/AppImage/appimaged/releases/download/continuous/appimaged-x86_64.AppImage"
chmod a+x $HOME/tmp/appimaged-x86_64.AppImage
$HOME/tmp/appimaged-x86_64.AppImage --install
# rm $HOME/tmp/appimaged-x86_64.AppImage
# the appimage install command seems to be removing this file on it's own. 

wget -O $HOME/tmp/AppImageUpdate-x86_64.AppImage \
    $(curl -s "https://api.github.com/repos/AppImage/AppImageUpdate/releases/tags/continuous" \
        | jq -r '.assets| .[] | select(.name | test("^AppImageUpdate.*x86_64.*AppImage$"; "s"))
        | .browser_download_url')
chmod a+x $HOME/tmp/AppImageUpdate-x86_64.AppImage
mv $HOME/tmp/AppImageUpdate-x86_64.AppImage $HOME/.local/bin
