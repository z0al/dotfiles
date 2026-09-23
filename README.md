# Dotfiles

An opinionated [flake](https://nix.dev/concepts/flakes)-based system configuration for both [NixOS](https://nixos.org)[^1] and macOS (via [nix-darwin](https://github.com/nix-darwin/nix-darwin)).

If you have no idea what any of that means, I highly recommend checking out Matthias's excellent [YouTube mini-course](https://youtu.be/AGVXJ-TIv3Y).

## Structure

### Temporary NixOS VM on Apple Silicon

`hosts/nixos/vm.nix` is a regular `aarch64-linux` NixOS host. It imports
microvm.nix to run as a temporary, headless VM with the shared NixOS and Home
Manager configuration and the normal `z0al` user:

```sh
nix run .#nixosConfigurations.vm.config.microvm.declaredRunner
```

The serial console logs in as `z0al` automatically. Run `sudo poweroff` in the
guest to stop it. The root filesystem and writable Nix store overlay live in
memory, so changes made inside the VM disappear on shutdown. The built NixOS
system and packages remain in the Mac's Nix store for faster subsequent starts.

The host uses microvm.nix with QEMU on macOS. Its interactive Cocoa graphics
backend is configured in `hosts/nixos/vm.nix`; enable graphics and add a NixOS
desktop environment there when needed. GUI-only programs are disabled for now.

This VM needs a Linux builder to build the guest system. The Darwin configuration
enables nix-darwin's Linux builder; apply it with your usual `darwin-rebuild`
command before launching the VM. Change `hosts/nixos/vm.nix` to test NixOS
options or services, then launch it again.

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

- `my.user` → `users.users.<username>`
  - e.g., `my.user.extraGroups`
- `my.programs` → `home-manager.users.<username>.programs`
  - e.g., `my.programs.terraform.enable`
- `my.presets` → `home-manager.users.<username>.presets`
  - e.g., `my.presets.devOps.enable`
- `my.deviceManager` → `home-manager.users.<username>.deviceManager`
  - e.g., `my.deviceManager.profiles`

The `<username>` refers to the primary user login, configured in [`modules/config/users`](./modules/config/users/default.nix).

## 📚 Credits

- [Henrik's dotfiles](https://github.com/hlissner/dotfiles)
- [Matthias's nixos-config](https://github.com/MatthiasBenaets/nix-config)

## 🧑‍⚖️ License

MIT © z0al

[^1]:
    This repo used to be heavily focused on NixOS, but life happens and I'm currently stuck on macOS 😔.
    While most NixOS-specific configurations have been removed, the repo is still NixOS-ready and waiting for the day I switch back soon ™️ (looking at you, [Asahi Linux](https://asahilinux.org/) 👀).
