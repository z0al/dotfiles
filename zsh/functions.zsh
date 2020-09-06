#!/bin/zsh

# mkdir then cd
mkcd() {
	mkdir -p "$@"
	cd "$@" || exit
}
