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
    ./services
  ];

  home = {
    username = user;
    homeDirectory = lib.mkForce "${homePrefix}/${user}";
    stateVersion = version;
  };

  xdg.enable = true;
  programs.ssh.enable = true;
  programs.home-manager.enable = true;
  xsession.numlock.enable = true;

  d.fs.persisted = {
    directories = [
      "Desktop"
      "Documents"
      "Downloads"
      "Music"
      "Pictures"
      "Videos"
      "github"
      ".dotfiles"
      ".ssh"
    ];
  };
}
