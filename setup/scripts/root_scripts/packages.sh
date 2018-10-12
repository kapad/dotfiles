#!/bin/bash

. lib.sh

as_root "$0" "$@"

# upgrade app packages presently installed just as a preventive measure to 
# any possible dependency issues. This may or may not really, help, but there
# shouldn't be any harm in it. 
apt-get update
apt-get -y upgrade

apt-add-repository -y ppa:git-core/ppa
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- \
    | apt-key add -
echo "deb https://download.virtualbox.org/virtualbox/debian $(lsb_release -c -s) contrib" \
    > /etc/apt/sources.list.d/virtualbox.list

apt-get update
apt-get install -y \
    apt-rdepends
    apt-transport-https \
    build-essential \
    caffeine \
    curl \
    dconf-editor \
    flatpak \
    gconf-editor \
    gimp \
    git \
    git-gui \
    gitk \
    gnome-software-plugin-flatpak \
    gnome-tweak-tool \
    graphviz graphviz-doc \
    hexchat \
    imagemagick \
    jq \
    meld \
    openjdk-11-jdk \
    openssh-server \
    pdfshuffler \
    python-gpg \
    shutter \
    steam \
    synaptic \
    terminator \
    ubuntu-restricted-addons \
    ubuntu-restricted-extras \
    ufw gufw \
    unison unison-gtk \
    vim \
    virtualbox-5.2 \
    vlc browser-plugin-vlc \
    xsane
