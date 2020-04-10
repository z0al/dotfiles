#!/bin/bash

sudo apt-get -y install zsh curl

# antibody
curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin
