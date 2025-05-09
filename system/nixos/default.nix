{ config, ... }:

{
  imports = [
    ../.
    ./gnome
    ./auto-login.nix
    ./boot.nix
    ./envfs.nix
    ./hardware.nix
    ./hidpi.nix
    ./network.nix
    ./nix-ld.nix
    ./pkgs.nix
    ./sound.nix
    ./systemd.nix
    ./tmpfs.nix
    ./trash.nix
  ];

  system.stateVersion = config.d.version;

  services.printing.enable = true;

  # Security
  security.polkit.enable = true;

  programs.dconf.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
