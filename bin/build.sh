#!/bin/sh

sudo nixos-rebuild build --flake .#$1
