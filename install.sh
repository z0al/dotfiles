#!/bin/sh
#
# Mostly taken from by https://github.com/caarlos0/dotfiles
# Thank you Carlos <3

set -e
echo ''

DOTFILES_DIR=$(pwd -P)

info() {
	printf "\r  [ \033[00;34mINFO\033[0m ] $1\n"
}

success() {
	printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

link_file() {
	if [ -e "$2" ]; then
		if [ "$(readlink "$2")" = "$1" ]; then
			success "skipped $1"
			return 0
		else
			mv "$2" "$2.backup"
			info "moved $2 to $2.backup"
		fi
	fi
	ln -sf "$1" "$2"
	success "linked $1 to $2"
}

install_plugins() {
	info "Installing zsh plugins"
	antibody bundle <"$DOTFILES_DIR/plugins.txt" >"$HOME/.zsh_plugins.sh"

	success "Installed zsh plugins"
}

install_dotfiles() {
	info "Installing dotfiles"

	# zsh
	link_file "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"

	# bash
	link_file "$DOTFILES_DIR/bash/.bashrc" "$HOME/.bashrc"
	link_file "$DOTFILES_DIR/bash/.inputrc" "$HOME/.inputrc"

	# spaceship
	link_file "$DOTFILES_DIR/starship/config.toml" "$HOME/.config/starship.toml"

	# custom
	link_file "$DOTFILES_DIR/.aliases" "$HOME/.aliases"
	link_file "$DOTFILES_DIR/.functions" "$HOME/.functions"
}

# Steps
install_plugins
install_dotfiles

echo ''
echo "Done, enjoy!"
