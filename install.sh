#!/bin/sh
#
# Some helpers are taken from Carlos's dotfiles:
# 	https://github.com/caarlos0/dotfiles
#

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

config_bash() {
	info "configuring bash"

	# Configs
	link_file "$DOTFILES_DIR/bash/.bashrc" "$HOME/.bashrc"
	link_file "$DOTFILES_DIR/bash/.bash_profile" "$HOME/.bash_profile"
	link_file "$DOTFILES_DIR/bash/.inputrc" "$HOME/.inputrc"

	# Plugins
	antibody bundle <"$DOTFILES_DIR/bash/plugins.txt" >"$HOME/.bash_plugins.sh"
}

config_zsh() {
	info "configuring zsh"

	# Configs
	link_file "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
	link_file "$DOTFILES_DIR/zsh/.zprofile" "$HOME/.zprofile"

	# Plugins
	antibody bundle <"$DOTFILES_DIR/zsh/plugins.txt" >"$HOME/.zsh_plugins.sh"
}

config_starship() {
	info "configuring starship"

	link_file "$DOTFILES_DIR/starship/config.toml" "$HOME/.config/starship.toml"
}

link_dotfiles() {
	info "linking other dotfiles"

	link_file "$DOTFILES_DIR/.aliases" "$HOME/.aliases"
	link_file "$DOTFILES_DIR/.exports" "$HOME/.exports"
	link_file "$DOTFILES_DIR/.functions" "$HOME/.functions"
	link_file "$DOTFILES_DIR/.gitignore" "$HOME/.gitignore"
}

# Setup
config_bash
config_zsh
config_starship
link_dotfiles

echo ''
echo "Done."
