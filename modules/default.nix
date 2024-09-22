{ pkgs, lib, ... }:

let
  glob = name:
    with lib.fileset;
    toList (fileFilter (file: file.name == name) ./.);
in

{
  imports = lib.flatten [
    [
      ./etc
      ./hm
      ./programs
      ./security
      ./system

      ./config.nix
      ./profiles.nix
    ]

    # **/*/_nixos.nix
    (lib.optionals pkgs.stdenv.isLinux (glob "_nixos.nix"))

    # **/*/_darwin.nix
    (lib.optionals pkgs.stdenv.isDarwin (glob "_darwin.nix"))
  ];
}
