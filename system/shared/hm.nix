{ config, pkgs, lib, user, ... }:

let
  homePrefix =
    if pkgs.stdenv.hostPlatform.isDarwin
    then "/Users"
    else "/home";
in

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.${user} = {
      xdg.enable = true;
      programs.ssh.enable = true;
      programs.home-manager.enable = true;

      home = {
        stateVersion = "22.11";

        username = user;
        homeDirectory = lib.mkForce "${homePrefix}/${user}";
      };
    };
  };
}
