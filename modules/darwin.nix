{ lib, ... }:

let
  darwinModules = lib.fileset.toList (
    lib.fileset.fileFilter
      (file: file.name == "_darwin.nix")
      ./.
  );
in

{
  imports = darwinModules ++ [
    ./shared.nix
  ];

  system.stateVersion = 5;
}
