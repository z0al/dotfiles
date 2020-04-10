# Dotfiles

My personal Ubuntu/Debian configurations for zsh, nvm, terminals and more. It also provides a script to automate the installation of software/packages I commonly use.

## Features

- 🚀 Super fast shell startup.
- 💅 Minimal and beautiful prompt.
- 🔥 Fuzzy completion + key bindings.
- 💤 Lazy load shell modules when possible.

## Dependencies

- [**python**][python]: requires v3.5 or later in order to run the scripts.
- [**antibody**][antibody]: a shell plugin manager made from the ground up thinking about performance.
- [**starship**][starship]: The minimal, blazing-fast, and infinitely customizable prompt for any shell.
- [**fzf**][fzf]: a command-line fuzzy finder to filter files, command history, processes, hostnames, bookmarks, git commits, etc.
- [**fd**][fd]: a simple, fast and user-friendly alternative to `find` that automatically respects `.gitignore` files.

## Installation

### Dotfiles

```sh
$ git clone https://github.com/z0al/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ ./configure.py
```

Restart your zsh shell to see the changes.

### Common Software/Packages

> **Tip:** This basically runs every `install.sh` file in this repository.

```sh
$ ./install.py
```

Running the above script will install the following software/packages:

- **Essentials:**
  - git
  - zsh
  - curl
  - snapd
  - dependencies listed [here](#dependencies)
- **Programming**
  - vim

## Tips

### Local configs

You can use `~/.localrc` for local configs e.g. secrets. If the file doesn't exist (most likely) create it yourself.

```sh
$ echo "export CUSTOM_STUFF=true" > ~/.localrc
```

### Color schemes

You can use [Gogh][gogh] to install awesome color scheme(s) for Gnome Terminal, iTerm and others.

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
