{ config, pkgs, lib, ... }:

let
  cfg = config.d.user;

  homeFolder =
    if pkgs.stdenv.isDarwin
    then "/Users/${cfg.name}"
    else "/home/${cfg.name}";
in

{
  imports = with lib; [
    (mkAliasOptionModule
      [ "my" "osUser" ]
      [ "users" "users" cfg.name ])

    (mkAliasOptionModule
      [ "my" "packages" ]
      [ "users" "users" cfg.name "packages" ])

    (mkAliasOptionModule
      [ "my" "user" ]
      [ "home-manager" "users" cfg.name ])
  ];

  config = {
    my.osUser = {
      name = cfg.name;
      description = cfg.name;
      home = homeFolder;
    };

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
    };

    my.user = {
      home = {
        username = cfg.name;
        homeDirectory = homeFolder;
        stateVersion = config.d.version;
      };

      xdg.enable = true;
      programs.ssh.enable = true;
      programs.home-manager.enable = true;
    };
  };
}

