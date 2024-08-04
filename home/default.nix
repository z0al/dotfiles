{ osConfig, pkgs, lib, ... }:

{
  imports = [
    ./autostart.nix
  ];

  home = {
    username = osConfig.d.user.name;
    homeDirectory = osConfig.users.users."${osConfig.d.user.name}".home;
    stateVersion = osConfig.d.version;
  };

  xdg.enable = true;
  programs.ssh.enable = true;
  programs.home-manager.enable = true;
  xsession.numlock.enable = pkgs.stdenv.isLinux;

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

      # Gnome Keyring
      ".local/share/keyrings"
    ];
  };
}
