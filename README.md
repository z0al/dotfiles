# Dotfiles

An opinionated [flake](https://nix.dev/concepts/flakes)-based system configuration for both [NixOS](https://nixos.org)[^1] and macOS (via [nix-darwin](https://github.com/nix-darwin/nix-darwin)).

If you have no idea what any of that means, I highly recommend checking out Matthias's excellent [YouTube mini-course](https://youtu.be/AGVXJ-TIv3Y).

## 🛍️ Goodies

Here are some of the unique features of my configuration you might find interesting:

- [**💻 Device Manager**](./modules/device-manager/_darwin.nix): Generates a `nix.mobileconfig` profile on macOS e.g. used to configure policies for Chromium-based browsers, which can then be manually installed via System Settings. The module warns the user if the profile changes and needs reapplying.

- [**👨‍💻 VS Code**](./modules/programs/vscode): A fully declarative VS Code configuration. The final `settings.json` file is copied (not linked), allowing for quick on-the-fly tweaks.

- [**🔐 1Password**](./modules/programs/1password): Uses 1Password as an SSH agent, Git authentication, and signing program. This keeps SSH keys and tokens in the password manager instead of on disk.

- [**🪟 Tiling**](./modules/config/tiling/_darwin.nix): Configures [AeroSpace](https://nikitabobko.github.io/AeroSpace/guide) for automatic window tiling on macOS.

- [**⚙️ Plist-manager**](https://github.com/z0al/plist-manager): A human-friendly macOS user defaults manager. The module has since been extracted and moved to [z0al/plist-manager](https://github.com/z0al/plist-manager).

## Structure

### Home vs NixOS/Darwin modules

This repo doesn't follow the usual `/home`, `/nixos`, `/darwin` structure. Instead, modules are organized by feature under `/modules` and ALL modules are system (nixos/nix-darwin) modules e.g.

```
modules
├── config
│   ├── ...
│   └── <module-a>.nix         # cross-platform module
├── programs
│   ├── <module-b>             # module with platform-specific implementations
│   │   ├── _darwin.nix        # → nix-darwin module
│   │   ├── _nixos.nix         # → nixos module
│   │   └── default.nix
│   ├── ...
│   └── <module-c>.nix         # another cross-platform module
└── ...
```

**How does it work?**

- `<module>/default.nix` defines the shared module configuration. It typically includes the module option definitions like `my.<module>.enable`. All custom modules are prefixed with `my.*` to avoid conflicts with upstream modules.
- `**/*/_nixos.nix` files are automatically imported in [`modules/nixos.nix`](./modules/nixos.nix).
- `**/*/_darwin.nix` files are automatically imported in [`modules/darwin.nix`](./modules/darwin.nix).
- Wherever possible, NixOS/nix-darwin modules are preferred over `home-manager`.
- Home-manager is mostly used to link home content via [`home.file`](https://nix-community.github.io/home-manager/options.xhtml#opt-home.file). When required, the configuration is written inline using [aliass](#aliases).

A practical example of a module that defines both `_nixos.nix` and `_darwin.nix` is the 1Password module in [`modules/programs/1password`](./modules/programs/1password).

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

The `<username>` refers to the primary user login, configured in [`modules/config/users`](./modules/config/users/default.nix).

## 📚 Credits

- [Henrik's dotfiles](https://github.com/hlissner/dotfiles)
- [Matthias's nixos-config](https://github.com/MatthiasBenaets/nix-config)

## 🧑‍⚖️ License

MIT © z0al

[^1]:
    This repo used to be heavily focused on NixOS, but life happens and I'm currently stuck on macOS 😔.
    While most NixOS-specific configurations have been removed, the repo is still NixOS-ready and waiting for the day I switch back soon ™️ (looking at you, [Asahi Linux](https://asahilinux.org/) 👀).
