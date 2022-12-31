#!/bin/sh

sudo nixos-rebuild switch --install-bootloader --flake .#$1
