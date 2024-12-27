{ pkgs, lib, ... }:

let
  glob = name:
    with lib.fileset;
    toList (fileFilter (file: file.name == name) ./.);
in

{
  imports = lib.flatten [
    [
      ./config
      ./programs
      ./style
      ./window-manager

      ./activation.nix
      ./config.nix
      ./presets.nix
    ]

    # **/*/_nixos.nix
    (lib.optionals pkgs.stdenv.isLinux (glob "_nixos.nix"))

    # **/*/_darwin.nix
    (lib.optionals pkgs.stdenv.isDarwin (glob "_darwin.nix"))
  ];
}
