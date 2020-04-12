#!/bin/sh

sudo apt-get install curl

curl -fsSL https://github.com/Schniz/fnm/raw/master/.ci/install.sh | bash -s -- --skip-shell
