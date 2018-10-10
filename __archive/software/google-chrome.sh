#!/bin/bash

wget -O $HOME/Downloads/google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i $HOME/Downloads/google-chrome.deb
rm $HOME/Downloads/google-chrome.deb