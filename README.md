# Dotfiles

An opinionated [flake](https://nix.dev/concepts/flakes)-based system configuration for both [NixOS](https://nixos.org)[^1] and macOS (via [nix-darwin](https://github.com/nix-darwin/nix-darwin)).

If you have no idea what any of that means, I highly recommend checking out Matthias's excellent [YouTube mini-course](https://youtu.be/AGVXJ-TIv3Y).

## 🛍️ Goodies

Here are some unique features of my configuration you might find interesting:

- [**🙅‍♂️ No home modules**](https://nix-community.github.io/home-manager/index.xhtml#ch-writing-modules): I find the split between `home-manager` and system-level modules (e.g. NixOS or nix-darwin modules) overly dramatic. It doesn't scale well when configuration spans both user and system layers, and it's unnecessary for single-user setups IMHO. Instead, [I group modules by feature](#unified-modules) and use system-level modules everywhere.

- [**🦁 Brave Module**](./modules/programs/brave): A custom module that uses [managed policies](https://support.brave.com/hc/en-us/articles/360039248271-Group-Policy) to de-bloat Brave and automate extensions and other settings.

- [**💻 Device Manager**](./modules/device-manager/_darwin.nix): Generates a `nix.mobileconfig` profile on macOS, which can then be manually installed via System Settings. The module warns the user if the profile changes and needs reapplying.

- [**👨‍💻 VS Code**](./modules/programs/vscode): A fully declarative VS Code configuration. The final `settings.json` file is copied (not linked), allowing for quick on-the-fly tweaks.

- [**🔐 1Password**](./modules/programs/1password): Uses 1Password as an SSH agent, Git authentication, and signing program. This keeps SSH keys and tokens in the password manager instead of on disk.

- [**🪟 Tiling**](./modules/config/tiling/_darwin.nix): Configures [AeroSpace](https://nikitabobko.github.io/AeroSpace/guide) for automatic window tiling on macOS.

- [**⚙️ Plist-manager**](https://github.com/z0al/plist-manager): A human-friendly macOS user defaults manager. The module has since been extracted and moved to [z0al/plist-manager](https://github.com/z0al/plist-manager).

## Structure

### Unified Modules

This repo doesn't follow the usual `/home`, `/nixos`, `/darwin` structure. Instead, modules are organized by feature under `/modules`:

```
<module>
  ├── _nixos.nix
  ├── _darwin.nix
  ├── ...
  └── default.nix
```

**How does it work?**

- `default.nix` defines the shared module configuration. It typically includes the module option definitions like `d.<module>.enable`. With very few exceptions, all custom modules are prefixed with `d.*` to avoid conflicts with upstream modules.
- `**/*/_nixos.nix` files are automatically loaded on NixOS via [`modules/nixos.nix`](./modules/nixos.nix).
- `**/*/_darwin.nix` files are automatically loaded on macOS via [`modules/darwin.nix`](./modules/darwin.nix).
- Wherever possible, NixOS/nix-darwin modules are preferred over `home-manager`. I aim to eventually remove `home-manager` entirely once there's a viable standalone replacement for [`home.file`](https://nix-community.github.io/home-manager/options.xhtml#opt-home.file).
- When `home-manager` is required, configuration is written inline using the `hm.*` [alias](#aliases).

A practical example of this structure is the 1Password module at [`modules/programs/1password`](./modules/programs/1password).

### Presets

Presets are flags that group related programs. For example, enabling `d.presets.devOps.enable` activates Docker, Kubernetes, Terraform, and others by default.

```nix
# Enable DevOps tools e.g. Docker, Terraform ..etc
d.presets.devOps.enable = true;

# Exclude Terraform
d.programs.terraform.enable = false;
```

Available presets can be found in [`modules/presets.nix`](./modules/presets.nix).

### Aliases

For convenience, I use the following option aliases:

- `hm` → `home-manager.users.<username>`
  - e.g., `hm.xdg.configFile`
- `my.user` → `users.users.<username>`
  - e.g., `my.user.extraGroups`

The `<username>` refers to the primary user login, configured in [`modules/vars.nix`](./modules/vars.nix).

## 📚 Credits

- [Henrik's dotfiles](https://github.com/hlissner/dotfiles)
- [Matthias's nixos-config](https://github.com/MatthiasBenaets/nix-config)

## 🧑‍⚖️ License

MIT © z0al

[^1]:
    This repo used to be heavily focused on NixOS, but life happens and I'm currently stuck on macOS 😔.
    While most NixOS-specific configurations has been removed, the repo is still NixOS-ready and waiting for the day I switch back soon ™️ (looking at you, [Asahi Linux](https://asahilinux.org/) 👀).
