# Dotfiles

An opinionated [flake](https://nix.dev/concepts/flakes)-based system configuration for both [NixOS](https://nixos.org)[^1] and macOS (via [nix-darwin](https://github.com/nix-darwin/nix-darwin)).

If you have no idea what any of that means, I highly recommend checking out Matthias's excellent [YouTube mini-course](https://youtu.be/AGVXJ-TIv3Y).

## Structure

### Home vs NixOS/Darwin modules

This repo doesn't follow the usual `/home`, `/nixos`, `/darwin` structure. Instead, modules are organized by feature under `/modules`, and each module can mix system (nixos/nix-darwin) and home-manager configuration e.g.

```
modules
├── config
│   ├── ...
│   └── <module-a>.nix         # cross-platform module
├── programs
│   ├── <module-b>             # module with platform-specific implementations
│   │   ├── _darwin.nix        # → nix-darwin module
│   │   ├── _nixos.nix         # → nixos module
│   │   └── _home.nix          # → home-manager module
│   ├── ...
│   └── <module-c>.nix         # another cross-platform module
└── ...
```

**How does it work?**

- `**/*/_home.nix` files are automatically imported as `home-manager.sharedModules` in [`modules/shared.nix`](./modules/shared.nix).
- `**/*/_nixos.nix` files are automatically imported in [`modules/nixos.nix`](./modules/nixos.nix).
- `**/*/_darwin.nix` files are automatically imported in [`modules/darwin.nix`](./modules/darwin.nix).
- Wherever an upstream `home-manager` module exists, it's preferred over a hand-rolled NixOS/nix-darwin one. System-level files (`_darwin.nix`/`_nixos.nix`) are mainly for what home-manager can't do itself: GUI app installs, homebrew casks, system defaults, and the like.
- Custom options with no upstream equivalent are declared directly under `programs.*` (inside `_home.nix`) so they read/write the same way as real home-manager options — see [Aliases](#aliases).

A practical example of a module that defines `_nixos.nix`, `_darwin.nix`, and `_home.nix` together is the 1Password module in [`modules/programs/1password`](./modules/programs/1password).

### Presets

Presets are flags that group related programs. For example, enabling `my.presets.devOps.enable` activates Docker, Kubernetes, Terraform, and others by default.

```nix
# Enable DevOps tools e.g. Docker, Terraform ..etc
my.presets.devOps.enable = true;

# Exclude Terraform
my.programs.terraform.enable = false;
```

Available presets can be found in [`modules/presets.nix`](./modules/presets.nix).

### Aliases

For convenience, I use the following option aliases:

- `home` → `home-manager.users.<username>.home`
  - e.g., `home.file`
- `xdg` → `home-manager.users.<username>.xdg`
  - e.g., `xdg.configFile`
- `my.user` → `users.users.<username>`
  - e.g., `my.user.extraGroups`
- `my.programs` → `home-manager.users.<username>.programs`
  - e.g., `my.programs.terraform.enable`

The `<username>` refers to the primary user login, configured in [`modules/config/users`](./modules/config/users/default.nix).

## 📚 Credits

- [Henrik's dotfiles](https://github.com/hlissner/dotfiles)
- [Matthias's nixos-config](https://github.com/MatthiasBenaets/nix-config)

## 🧑‍⚖️ License

MIT © z0al

[^1]:
    This repo used to be heavily focused on NixOS, but life happens and I'm currently stuck on macOS 😔.
    While most NixOS-specific configurations have been removed, the repo is still NixOS-ready and waiting for the day I switch back soon ™️ (looking at you, [Asahi Linux](https://asahilinux.org/) 👀).
