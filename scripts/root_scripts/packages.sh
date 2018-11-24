#!/bin/bash


BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
. $BASE_DIR/../lib.sh
as_root "$0" "$@"

# upgrade app packages presently installed just as a preventive measure to 
# any possible dependency issues. This may or may not really, help, but there
# shouldn't be any harm in it. 
apt-get update
apt-get -y upgrade

#######
# Apt #
#######
apt-add-repository -y ppa:git-core/ppa
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- \
    | apt-key add -
echo "deb https://download.virtualbox.org/virtualbox/debian $(lsb_release -c -s) contrib" \
    > /etc/apt/sources.list.d/virtualbox.list

pkg_list=( 
    apt-rdepends
    apt-transport-https
    build-essential
    caffeine
    chkrootkit
    clipit
    curl
    dconf-editor
    flatpak
    gconf-editor
    gimp
    git git-gui gitk git-cola
    gnome-software-plugin-flatpak
    gnome-tweak-tool
    graphviz graphviz-doc
    hexchat
    imagemagick
    jq
    lynis
    meld
    openjdk-11-jdk
    openssh-server
    pdfshuffler
    python-gpg
    python-pip
    python3-pip
    secure-delete
    shutter
    steam
    synaptic
    terminator
    ubuntu-restricted-addons
    ubuntu-restricted-extras
    ufw gufw
    unison unison-gtk
    vim
    virtualbox-5.2
    vlc browser-plugin-vlc
    xclip
    xsane
    # required to compile the pop gtk theme from source.
    libtool pkg-config sassc optipng parallel libglib2.0-dev libgdk-pixbuf2.0-dev librsvg2-dev libxml2-utils
)

apt-get update

# accepting the mscorefonts installer license so that the installation script doesn't stop for user input.
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections

apt-get install -y "${pkg_list[@]}"

#########
# Snaps #
#########
# multiple classic snaps cannot be installed in a single command. 
snap install --classic skype
snap install --classic sublime-text
snap install --classic vscode
snap install --classic atom

snaps_list=(
    pdftk
    chromium # prefer using to google chrome which tracks the shit out of you.
    inkscape # required to compile the pop theme from source.
)
snap install "${snaps_list[@]}"
    
