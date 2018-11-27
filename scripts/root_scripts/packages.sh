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

pkg_list=( 
    apt-rdepends
    apt-transport-https
    build-essential
    caffeine
    ca-certificates
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
    ruby-full
    secure-delete
    shutter
    software-properties-common
    steam
    synaptic
    terminator
    ubuntu-restricted-addons
    ubuntu-restricted-extras
    ufw gufw
    unison unison-gtk
    vim
    vlc browser-plugin-vlc
    xclip
    xsane
    # dependencies for downloading ruby via rubyenv
    libssl-dev libreadline-dev
)

apt-get update

# accepting the mscorefonts installer license so that the installation script doesn't stop for user input.
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections

apt-get install -y "${pkg_list[@]}"

# Additional repos and packages.
################################
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- \
    | apt-key add -
echo "deb https://download.virtualbox.org/virtualbox/debian $(lsb_release -c -s) contrib" \
    > /etc/apt/sources.list.d/virtualbox.list

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list

additional_pkg_list=(
    docker-ce
    sublime-merge
    virtualbox-5.2
)

apt-get update

apt-get install -y "${additional_pkg_list[@]}"


#########
# Snaps #
#########
# multiple classic snaps cannot be installed in a single command. 
snap install --classic atom
snap install --classic node --channel=10 # using channel 10, which is currently the LTS release for node.
snap install --classic skype
snap install --classic sublime-text
snap install --classic vscode

snaps_list=(
    pdftk
    chromium # prefer using to google chrome which tracks the shit out of you.
    inkscape # required to compile the pop theme from source.
)
snap install "${snaps_list[@]}"
    
