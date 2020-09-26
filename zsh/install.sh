#!/bin/sh

# Essentials
sudo apt-get -y install \
vim \
zsh \
curl \
fonts-firacode \
pulseaudio \
python3-pip

# antibody
curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin
