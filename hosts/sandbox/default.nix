{ config, pkgs, lib, username, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # User Management
  users.users.${username} = {
    # For convenience since it's a VM. Don't use in production
    password = "sandbox";

    # Allow mounting & accessing of shared folders.
    extraGroups = [ "vboxsf" ];
  };


  # Networking
  networking.hostName = "sandbox";


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
