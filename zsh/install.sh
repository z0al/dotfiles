#!/bin/sh

sudo apt-get -y install \
# Essentials
vim \
zsh \
curl \

# Terminal font
fonts-firacode \

# Other packages
pulseaudio \
python3-pip

# antibody
curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin

