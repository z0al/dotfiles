{ config, pkgs, user, ... }:

let
  homePrefix =
    if pkgs.stdenv.hostPlatform.isDarwin
    then "/Users"
    else "/home";
in

{
  programs.dconf.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.${user} = {
      xdg.enable = true;
      programs.ssh.enable = true;
      programs.home-manager.enable = true;

      home = {
        inherit (config.system) stateVersion;

        username = user;
        homeDirectory = "${homePrefix}/${user}";
      };
    };
  };
}
