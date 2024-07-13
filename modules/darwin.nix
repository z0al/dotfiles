{ lib, ... }:

{
  # Auto-import all **/_darwin.nix
  imports = builtins.filter
    (module: baseNameOf module == "_darwin.nix")
    (lib.filesystem.listFilesRecursive ./.);
}
