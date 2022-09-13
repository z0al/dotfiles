#!/bin/sh

sudo nixos-rebuild switch --flake .#$1
