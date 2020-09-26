#!/bin/sh

# Essentials
sudo apt-get -y install zsh curl fonts-firacode vim pulseaudio

# antibody
curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin

