{ config, pkgs, lib, username, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # User Management
  users.users.${username} = {
    # Allow mounting & accessing of shared folders.
    extraGroups = [ "vboxsf" ];
    password = "demo";
  };

  # Auto login
  services.xserver.displayManager = {
    autoLogin = {
      enable = true;
      user = "${username}";
    };
  };

  # https://github.com/NixOS/nixpkgs/issues/103746
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Security
  security = {
    sudo.wheelNeedsPassword = false;
  };
}
