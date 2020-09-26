# Dotfiles

My personal Pop OS/Debian configurations for zsh, Node.js, terminals and more.

## Includes

- [**Python**][python]: requires v3.5 or later in order to run the scripts.
- [**Alacritty**][alacritty]: A cross-platform, GPU-accelerated terminal emulator.
- [**Antibody**][antibody]: a shell plugin manager made from the ground up thinking about performance.
- [**Starship**][starship]: The minimal, blazing-fast, and infinitely customizable prompt for any shell.
- [**Fzf**][fzf]: a command-line fuzzy finder to filter files, command history, processes, hostnames, bookmarks, git commits, etc.
- [**Fd**][fd]: a simple, fast and user-friendly alternative to `find` that automatically respects `.gitignore` files.

## Installation

### Installing packages

> **Tip:** This basically runs every `install.sh` file in this repository.

```sh
$ ./install.py
```

Running the above script will install all the necessary dependencies along with essential pcakges e.g. snapd, vim, pulseaudio ..etc. For the full list of check `install.sh` files.

### Linking dotfiles

```sh
$ git clone https://github.com/z0al/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ ./configure.py
```

Restart your zsh shell to see the changes.

## Tips

### Local configs

You can use `~/.localrc` for local configs e.g. secrets. If the file doesn't exist (most likely) create it yourself.

```sh
$ echo "export CUSTOM_STUFF=true" > ~/.localrc
```

## Standalone scripts

This repository also contains standalone scripts to automate certain functions. Check the [scripts](./scripts) folder to find out more.

## Credits

Inspired by [caarlos0's dotfiles](https://github.com/caarlos0/dotfiles).

## License

MIT © Ahmed T. Ali

[antibody]: https://getantibody.github.io
[starship]: https://starship.rs/
[fzf]: https://github.com/junegunn/fzf
[fd]: https://github.com/sharkdp/fd
[gogh]: https://mayccoll.github.io/Gogh/
[python]: http://python.org/
[alacritty]: https://github.com/alacritty/alacritty
