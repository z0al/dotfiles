#!/bin/sh

# Windows and Linux store their time in the BIOS differently,
# this will cause your clock to be desynchronized when you switch
# from one OS to the other.
# 
# Ref: https://support.system76.com/articles/dual-booting/#fix-your-clock
timedatectl set-local-rtc 1 --adjust-system-clock