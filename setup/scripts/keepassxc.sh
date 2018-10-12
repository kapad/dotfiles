#!/bin/bash

# should get automatically installed by appimaged
wget -O $HOME/Applications/KeePassXC.AppImage \
  $(curl -s "https://api.github.com/repos/keepassxreboot/keepassxc/releases/latest" \
    | jq -r '.assets | .[] | select(.name | test("^KeePassXC.*AppImage$"; "s")) | .browser_download_url')
chmod a+x $HOME/Applications/KeePassXC.AppImage
