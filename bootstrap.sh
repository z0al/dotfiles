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
	if [ -e "$HOME/$2" ]; then
		if [ "$(readlink "$HOME/$2")" = "$DOTFILES_DIR/$1" ]; then
			success "skipped $1"
			return 0
		else
			mv "$HOME/$2" "$HOME/$2.backup"
			info "moved ~/$2 to ~/$2.backup"
		fi
	fi
	ln -sf "$DOTFILES_DIR/$1" "$HOME/$2"
	success "linked $1 to ~/$2"
}

setup_zsh() {
	info "setting up zsh"

	# Configs
	link_file "zsh/.zshrc" ".zshrc"
	link_file "zsh/.zprofile" ".zprofile"

	# Plugins
	antibody bundle <"$DOTFILES_DIR/zsh/plugins.txt" >"$HOME/.zsh_plugins.sh"

	echo ''
}

setup_starship() {
	info "setting up starship"

	link_file "starship/config.toml" ".config/starship.toml"

	echo ''
}

link_dotfiles() {
	info "linking other dotfiles"

	link_file ".aliases" ".aliases"
	link_file ".exports" ".exports"
	link_file ".functions" ".functions"
	link_file ".gitignore" ".gitignore"

	echo ''
}

# Setup
setup_zsh
setup_starship
link_dotfiles

echo "Done."
