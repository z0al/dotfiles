{ inputs, lib, ... }:

{
  imports = [ inputs.microvm.nixosModules.microvm ];

  microvm = {
    hypervisor = "qemu";
    vmHostPackages = inputs.nixpkgs.legacyPackages.aarch64-darwin;
    graphics = {
      enable = true;
      backend = "cocoa";
    };
    vcpu = 4;
    mem = 6144;
    interfaces = [
      {
        type = "user";
        id = "vm-net";
        mac = "02:00:00:00:00:01";
      }
    ];
    volumes = [ ];
    writableStoreOverlay = "/nix/.rw-store";
  };

  # The VM's root and store overlay are temporary RAM filesystems.
  nix.optimise.automatic = lib.mkForce false;
  nix.gc.automatic = lib.mkForce false;

  hardware.graphics.enable = true;
  services.xserver.enable = true;
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;
  services.displayManager.autoLogin = {
    enable = true;
    user = "z0al";
  };
  users.users.z0al.extraGroups = [ "video" ];

  home-manager.users.z0al.programs.starship.settings.hostname = {
    ssh_only = false;
    format = "[$hostname]($style) ";
    style = "bold yellow";
  };

  services.getty.autologinUser = "z0al";
  security.sudo.wheelNeedsPassword = false;
}
