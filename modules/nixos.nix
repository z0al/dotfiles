{ lib, ... }:

let
  nixosModules = lib.fileset.toList (
    lib.fileset.fileFilter (file: file.name == "_nixos.nix") ./.
  );
in

{
  imports = nixosModules ++ [
    ./shared.nix
  ];

  system.stateVersion = lib.trivial.release;
}
