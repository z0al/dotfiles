{ config, inputs, modulesPath, ... }:

let
  user = config.d.user.name;
in

{
  imports = [
    "${modulesPath}/virtualisation/qemu-vm.nix"
  ];

  # Configure networking
  networking.useDHCP = false;
  networking.interfaces.eth0.useDHCP = true;

  services.getty.autologinUser = user;
  security.sudo.wheelNeedsPassword = false;

  virtualisation = {
    graphics = true;
    host.pkgs = inputs.nixpkgs.legacyPackages.${config.system.build.hostSystem};
  };
}
