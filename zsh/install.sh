#!/bin/bash

sudo apt-get -y install zsh curl

# antibody
curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin

# Set zsh as default shell
chsh -s $(which zsh)
