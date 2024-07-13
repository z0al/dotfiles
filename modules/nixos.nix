{ lib, ... }:

{
  # Auto-import all **/_nixos.nix
  imports = builtins.filter
    (module: baseNameOf module == "_nixos.nix")
    (lib.filesystem.listFilesRecursive ./.);
}
