#!/bin/bash

# fzf: a command-line fuzzy finder
# https://github.com/junegunn/fzf
if $(sudo apt-get -y install fzf &>/dev/null); then
	fzf --version
else
	# dependencies
	sudo apt-get -y install git

	# clone source
	rm -rf ~/.fzf
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

	# install & verify
	~/.fzf/install --no-key-bindings --no-completion --no-update-rc
	~/.fzf/bin/fzf --version
fi


# fd: a simple, fast and user-friendly alternative to 'find'
# https://github.com/sharkdp/fd
if $(sudo apt-get -y install fd-find &>/dev/null); then
	fdfind --version
else
	# dependencies
	sudo apt-get -y install curl

	# download binary
	url="https://github.com/sharkdp/fd/releases/download/v7.5.0/fd_7.5.0_amd64.deb"
	curl -L $url -o /tmp/fd_amd64.deb

	# install && verify
	sudo dpkg -i /tmp/fd_amd64.deb
	sudo apt-get install -f
	fd --version
fi

