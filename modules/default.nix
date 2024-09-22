{ pkgs, lib, ... }:

let
  glob = name:
    with lib.fileset;
    toList (fileFilter (file: file.name == name) ./.);
in

{
  imports = lib.flatten [
    [
      ./desktop
      ./programs
      ./security
      ./services
      ./shells
      ./system
      ./window-manager

      ./config.nix
      ./presets.nix
      ./std.nix
    ]

    # **/*/_nixos.nix
    (lib.optionals pkgs.stdenv.isLinux (glob "_nixos.nix"))

    # **/*/_darwin.nix
    (lib.optionals pkgs.stdenv.isDarwin (glob "_darwin.nix"))
  ];
}
