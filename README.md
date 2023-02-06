# Dotfiles

My [NixOS](https://nixos.org/) ❄ / MacOS 🍏 configuration as a [flake](https://nixos.wiki/wiki/Flakes). It supports multiple hosts:

- Sandbox: VirtualBox VM for testing
- MacBook: My personal MacBook Pro
- Thinkpad: Work laptop. It's a ThinkPad X1 Carbon 7th edition

## Tips

### Local configs

You can use `~/.localrc` for machine-specific configs e.g:

```sh
echo "export CUSTOM_STUFF=true" > ~/.localrc
```

This is read by both of `fish` and `bash` shells.

## Credits

- [Matthias Benaets's nixos-config](https://github.com/MatthiasBenaets/nixos-config). I highly recommend watching their mini-course on [YouTube](https://youtu.be/AGVXJ-TIv3Y).
- [Digga](https://github.com/divnix/digga/): This repo was initially built with Digga and I still borrow some of its utils today.

## License

MIT © Ahmed T. Ali
