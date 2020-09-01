#!/bin/sh

# Essentials
sudo apt-get -y install build-essential git curl vim snapd

# https://github.com/Mayccoll/Gogh dependencies
sudo apt-get -y install dconf-cli uuid-runtime


# Fix BIOS Clock
# https://support.system76.com/articles/dual-booting/#fix-your-clock
timedatectl set-local-rtc 1 --adjust-system-clock
