#!/bin/bash

# this script is written for my primary laptop. 
# needs to be rewritten for a home server, because that is how I will use ubuntu now. 

# utility function to change to root. 
function as_root {
    if (($EUID != 0)); then
        if [[ -t 1 ]]; then
            sudo "$@"
        else
            exec 1>output_file
            gksu "$@"
        fi
        exit
    fi
}
# pass the current user when calling the script as root. 
as_root "$0" "$USER"

# this is the username of the user that initiated installtion. 
# it is required to append to the groups that this user belongs to. 
original_user=$1

# upgrade app packages presently installed just as a preventive measure to 
# any possible dependency issues. This may or may not really, help, but there
# shouldn't be any harm in it. 
apt-get update
apt-get -y upgrade

#######
# Apt #
#######

# adding some ppas depends on the following packages already being installed. 
pre_install_dependencies=(
    apt-transport-https
    ca-certificates
    curl
    gnupg-agent
    libpango1.0-0 libpangox-1.0-0 # dependencies for dropbox
    software-properties-common
)
apt-get install -y "${pre_install_dependencies[@]}"

# git
apt-add-repository --yes --no-update ppa:git-core/ppa
# git-cola
apt-add-repository --yes --no-update ppa:pavreh/git-cola
# openjdk - latest java
apt-add-repository --yes --no-update ppa:openjdk-r/ppa
# virtualbox
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- \
    | apt-key add -
echo "deb https://download.virtualbox.org/virtualbox/debian $(lsb_release -c -s) contrib" \
    > /etc/apt/sources.list.d/virtualbox.list
# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
# sublime text and sublime merge
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list


pkg_list=( 
    apt-rdepends
    build-essential
    caffeine
    chkrootkit
    chrome-gnome-shell
    dconf-editor
    docker-ce docker-ce-cli containerd.io
    gawk gawk-doc
    gconf-editor
    git git-gui gitk git-cola
    gnome-software-plugin-flatpak
    gnome-tweak-tool
    graphviz graphviz-doc
    hexchat
    imagemagick
    inxi
    jq
    libssl-dev libreadline-dev # dependencies for downloading ruby via rubyenv
    lm-sensors
    lynis
    meld
    mysql-client
    mysql-server
    openjdk-11-doc
    openjdk-11-jdk
    openjdk-11-source
    openjdk-8-doc
    openjdk-8-jdk
    openjdk-8-source
    openssh-server
    pdfshuffler
    python-gpg
    python-pip
    python3-pip
    ruby-full
    secure-delete
    shutter libappindicator-dev # libappindicator-dev as work around for the missing shutter icon.
    sublime-merge
    sublime-text
    synaptic
    terminator
    tree
    ubuntu-restricted-addons
    ubuntu-restricted-extras
    ufw gufw # firewall utilities
    unison unison-gtk # to backup the filesystem on an external hdd. 
    vim
    virtualbox-5.2
    vlc browser-plugin-vlc
    xclip
    xsane
)

# update again because new repos have been added. 
apt-get update

# accepting the mscorefonts installer license so that the installation script doesn't stop for user input.
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections

apt-get install -y "${pkg_list[@]}"

# add the docker group if it doesn't exist. 
[ $(getent group docker) ] || groupadd docker

# if this isn't done, then only the root user will be able to use mysql and docker.
usermod -a -G mysql,docker $original_user

# qt5 fix? *unconfirmed*
# some software that uses qt5 didn't work until the following packages were reinstalled. 
# issue faced with: virtualbox, git-cola
apt-get --reinstall install libqt5dbus5 libqt5widgets5 libqt5network5 libqt5gui5 libqt5core5a libdouble-conversion1 libxcb-xinerama0

#########
# Snaps #
#########
# multiple classic snaps cannot be installed in a single command. 
# i think classic snaps are pointless wrappers. might as well move what I can to ppas and apt. 
snap install --classic atom
# snap install --classic kubectl
snap install --classic skype
snap install --classic code

snaps_list=(
    pdftk
    chromium # prefer using to google chrome which tracks the shit out of you.
    inkscape # required to compile the pop theme from source.
    insomnia # API development/testing - similar to POSTMAN
)
snap install "${snaps_list[@]}"

# work around for the missing shutter icon. 
# http://tipsonubuntu.com/2018/05/25/re-enable-shutter-app-icon-ubuntu-18-04-system-tray/
PERL_MM_USE_DEFAULT=1 cpan -i Gtk2::AppIndicator


###########
# Dropbox #
###########
# this package is the dropbox installer, which then downloads and installs the latest version of dropbox. 
# therefore, though it's a package released in 2015, it should be safe to use in a script. 
wget -O /tmp/dropbox.deb "https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb"
dpkg -i /tmp/dropbox.deb
rm /tmp/dropbox.deb

###########
# Calibre #
###########
# calibre has a simple installer script that is version agnostic. 
# the downside IMO is using sudo for a third party installation script. 
wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin

#################
# Google Chrome #
#################
wget -O /tmp/google-chrome-stable_current_amd64.deb "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
# when this package is installed it also adds the google-chrome ppa to the apt sources directory. 
# updates to chrome are then handled by `apt upgrade`
dpkg -i /tmp/google-chrome-stable_current_amd64.deb
rm /tmp/google-chrome-stable_current_amd64.deb


###############
# sysctl.conf #
###############
cat <<END >> /etc/sysctl.conf

###################################################################
# Swappiness. 
# 
# The default for ubuntu is 60 which is much too high for systems with a large 
# amount of RAM. This laptop has 16GB. 
vm.swappiness = 10

###################################################################
# inotify - max user watches. 
# 
# The number of open file descriptors that can watch the file 
# system for any changes. 
# https://confluence.jetbrains.com/display/IDEADEV/Inotify+Watches+Limit
fs.inotify.max_user_watches = 524288
END

# TODO: Setup firewall 
# TODO: Testing of the above script. 