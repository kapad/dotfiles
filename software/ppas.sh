#!/bin/bash

################
### ADD PPAs ###
################
sudo apt-get update
sudo apt-get install -y apt-transport-https

sudo add-apt-repository -y ppa:webupd8team/atom

sudo add-apt-repository -y ppa:webupd8team/brackets

sudo add-apt-repository -y ppa:git-core/ppa

sudo add-apt-repository -y ppa:phoerious/keepassxc

echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo add-apt-repository -y ppa:webupd8team/java

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# the deb package may be doing all of this on it's own and should be a better way to install. 
# wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
# wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
# echo "deb https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.org.list

sudo apt-get update

#########################
### INSTALL FROM PPAs ###
#########################

sudo apt-get install -y \
												atom \
												brackets \
												git \
												keepassxc \
												oracle-java8-installer oracle-java8-set-default \
												sublime-text
