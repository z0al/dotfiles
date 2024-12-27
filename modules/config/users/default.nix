{ config, pkgs, lib, ... }:

let
  username = config.d.user.name;

  homeFolder =
    if pkgs.stdenv.isDarwin
    then "/Users/${username}"
    else "/home/${username}";
in

{
  imports = with lib; [
    (mkAliasOptionModule
      [ "my" "user" ]
      [ "users" "users" username ])
  ];

  config = {
    my.user = {
      name = username;
      description = username;
      home = homeFolder;
      shell = pkgs.fish;
    };
  };
}

