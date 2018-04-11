#!/bin/bash

wget -O $HOME/Downloads/virtualbox.deb https://download.virtualbox.org/virtualbox/5.2.8/virtualbox-5.2_5.2.8-121009~Ubuntu~zesty_amd64.deb
sudo dpkg -i $HOME/Downloads/virtualbox.deb
rm $HOME/Downloads/virtualbox.deb

wget -O $HOME/Downloads/vagrant.deb https://releases.hashicorp.com/vagrant/2.0.3/vagrant_2.0.3_x86_64.deb
sudo dpkg -i $HOME/Downloads/vagrant.deb
rm $HOME/Downloads/vagrant.deb