{ config, pkgs, lib, username, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # User Management
  users.users.${username} = {
    # Allow mounting & accessing of shared folders.
    extraGroups = [ "vboxsf" ];
  };

  # Auto login
  services.xserver.displayManager = {
    autoLogin = {
      enable = true;
      user = "${username}";
    };
  };

  # Security
  security = {
    sudo.wheelNeedsPassword = false;
  };
}
