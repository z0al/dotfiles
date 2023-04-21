{ pkgs, lib, user, version, ... }:

let
  homePrefix =
    if pkgs.stdenv.isDarwin
    then "/Users"
    else "/home";
in

{
  imports = [
    ./apps
    ./cli
    ./dev
    ./startup.nix
  ];

  home = {
    username = user;
    homeDirectory = lib.mkForce "${homePrefix}/${user}";
    stateVersion = version;
  };

  xdg.enable = true;
  programs.ssh.enable = true;
  programs.home-manager.enable = true;

  d.fs.persisted = {
    directories = [
      "Desktop"
      "Downloads"
      "Music"
      "Pictures"
      "Documents"
      "Videos"
      ".dotfiles"
      ".ssh"
    ];
  };
}
