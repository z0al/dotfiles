{ lib, ... }:

let
  homeModules = lib.fileset.toList (lib.fileset.fileFilter (f: f.name == "_home.nix") ./.);
in

{
  imports = [
    ./activation
    ./config
    ./programs

    ./presets.nix
  ];

  home-manager.sharedModules = homeModules;
}
