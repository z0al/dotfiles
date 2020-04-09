#!/bin/zsh
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
			success "moved $2 to $2.backup"
		fi
	fi
	ln -sf "$1" "$2"
	success "linked $1 to $2"
}

setup_zsh() {
	info "setting up zsh plugins"
	antibody bundle <"$DOTFILES_DIR/zsh/plugins.txt" >"$HOME/.zsh_plugins.sh"
}

setup_starship() {
	info "setting up starship"
	link_file "$DOTFILES_DIR/starship/config.toml" "$HOME/.config/starship.toml"
}

link_dotfiles() {
	info "linking dotfiles"

	find -H "$DOTFILES_DIR" -maxdepth 3 -name '*.symlink' -not -path '*.git*' |
		while read -r src; do
			dst="$HOME/$(basename "${src%.*}")"
			link_file "$src" "$dst"
		done
}

# Setup
setup_zsh
setup_starship
link_dotfiles

echo "Done."
