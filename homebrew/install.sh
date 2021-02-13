#!/bin/sh

# Forces the installation script to not wait for user input
export CI=true

# See https://docs.brew.sh/Homebrew-on-Linux
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"