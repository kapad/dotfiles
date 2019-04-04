#!/bin/bash

# root_scripts/packages installs "ruby-full". A minimal version of ruby is already installed by default in all Ubuntu distros. 
# For development projects it's best to create a seperate env for each project. 
# this script only install rvm and rubyenv. For every project, the env for that project needs to be manually installed. 

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable --ignore-dotfiles

# rubyenv
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
