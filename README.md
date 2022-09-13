# Dotfiles

My [NixOS](https://nixos.org/) ❄ configuration as a [flake](https://nixos.wiki/wiki/Flakes). It supports multiple hosts:

- Desktop: personal home PC (dual boot)
- Laptop: personal laptop
- Work: work laptop
- Sandbox: a VirtualBox VM for testing

## Components

| x            | Component   |
| ------------ | ----------- |
| **Shell**    | Fish        |
| **Desktop**  | Gnome (gdm) |
| **Terminal** | Alacritty   |
| **Editors**  | ?           |

## Installation

TBD

## Tips

### Local configs

You can use `~/.localrc` for machine-specific configs e.g:

```sh
$ echo "export CUSTOM_STUFF=true" > ~/.localrc
```

## Credits

Inspired by [Matthias Benaets's nixos-config](https://github.com/MatthiasBenaets/nixos-config). I highly recommend watching their mini-course on [YouTube](https://youtu.be/AGVXJ-TIv3Y).

## License

MIT © Ahmed T. Ali

[starship]: https://starship.rs/
[fzf]: https://github.com/junegunn/fzf
[fd]: https://github.com/sharkdp/fd
[alacritty]: https://github.com/alacritty/alacritty
