{ config, pkgs, lib, username, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  users.users.${username} = {
    # For convenience since it's a VM. Don't use in production
    password = "sandbox";

    # Allow mounting & accessing of shared folders.
    extraGroups = [ "vboxsf" ];
  };

  security.sudo.wheelNeedsPassword = false;

  services.xserver.displayManager = {
    autoLogin = {
      enable = true;
      user = "${username}";
    };
  };
}
