{ inputs, lib, ... }:

{
  imports = [ inputs.microvm.nixosModules.microvm ];

  system.stateVersion = "26.05";
  networking.useDHCP = true;

  microvm = {
    hypervisor = "qemu";
    vmHostPackages = inputs.nixpkgs.legacyPackages.aarch64-darwin;
    graphics = {
      enable = false;
      backend = "cocoa";
    };
    vcpu = 2;
    mem = 2304;
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

  # GUI applications can be enabled when this host gets a desktop.
  my.programs = {
    _1password.enable = false;
    beekeeper-studio.enable = false;
    chrome.enable = false;
    vscode.enable = false;
    wezterm.enable = false;
  };

  home-manager.users.z0al.programs.starship.settings.hostname = {
    ssh_only = false;
    format = "[VM:$hostname]($style) ";
    style = "bold yellow";
  };

  services.getty.autologinUser = "z0al";
  security.sudo.wheelNeedsPassword = false;
}
