{ lib, inputs, ... }:

let
  homeModules = lib.fileset.toList (
    lib.fileset.fileFilter (f: f.name == "_home.nix") ./.
  );
in

{
  imports = [
    ./activation
    ./config
  ];

  home-manager.sharedModules = homeModules ++ [
    inputs.nix-index.homeModules.nix-index
  ];
}
