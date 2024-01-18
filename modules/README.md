# Modules

A collection of [Nix modules](https://nix.dev/tutorials/module-system/module-system.html) with following conventions/constraints:

**Structure:**

- Module options _must_ be prefixed with `d` (for dotfiles) to avoid conflicts with upstream.
- A module _should_ expose a `d.module.enable` option to enable/disable its configuration as needed.
- `d.module.enable` option must default to the relevant `d.profile.<name>.enable` (if any). Profiles are used to group relevant modules for convenience.

**Compatibility:**

- A module code must work when loaded in both NixOS & nix-darwin.
- A module _may_ define a special file `_nixos.nix` or `_darwin.nix` for platform-specific implementation if needed.
- The platform-specific _must_ not be imported directly as they are automatically loaded for the target platform in `flake.nix`.
