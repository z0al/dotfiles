{ config, pkgs, lib, theme, ... }:

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
      [ "my" "user" ]
      [ "home-manager" "users" cfg.name ])
  ];

  config = {
    my.osUser = {
      name = cfg.name;
      description = cfg.name;
      home = homeFolder;
      shell = pkgs.fish;
    };

    my.user.imports = [
      ../../../home # Legacy
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      extraSpecialArgs = {
        inherit theme;
      };
    };
  };
}

