#!/bin/bash

wget "https://github.com/AppImage/appimaged/releases/download/continuous/appimaged-x86_64.AppImage"
chmod a+x appimaged-x86_64.AppImage
./appimaged-x86_64.AppImage --install
rm appimaged-x86_64.AppImage

wget -O AppImageUpdate-x86_64.AppImage \
    $(curl -s "https://api.github.com/repos/AppImage/AppImageUpdate/releases/tags/continuous" \
        | jq -r '.assets| .[] | select(.name | test("^AppImageUpdate.*x86_64.*AppImage$"; "s"))
        | .browser_download_url')
chmod a+x AppImageUpdate-x86_64.AppImage
mv AppImageUpdate-x86_64.AppImage $HOME/.local/bin
