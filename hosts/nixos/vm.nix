{
  lib,
  config,
  inputs,
  ...
}:

let
  # Set per-system by the flake's `vm` app (flake/hosts.nix), so it
  # always matches whichever machine actually runs the hypervisor.
  hostPkgs = config.microvm.vmHostPackages;
  isDarwinHost = hostPkgs.stdenv.isDarwin;

  hostHome =
    if isDarwinHost then
      "/Users/${config.my.user.name}"
    else
      "/home/${config.my.user.name}";

  stateDir = "${hostHome}/.local/state/dotfiles-vm";
  stateImage = "${stateDir}/root.img";
in

{
  imports = [
    inputs.microvm.nixosModules.microvm
  ];

  microvm = {
    hypervisor = "qemu";

    # Defaults to a relative "vm.sock" in whatever directory `nix run`
    # was invoked from (e.g. this repo root), which then breaks flake
    # evaluation since a stray socket file isn't a valid source file.
    socket = "${stateDir}/vm.sock";

    graphics = {
      enable = true;
      backend = if isDarwinHost then "cocoa" else "gtk";
    };

    qemu.serialConsole = false;

    qemu.extraArgs = [
      "-chardev"
      "qemu-vdagent,id=vdagent,name=vdagent,clipboard=on"
      "-device"
      "virtio-serial-pci"
      "-device"
      "virtserialport,chardev=vdagent,name=com.redhat.spice.0"
    ]
    ++ lib.optionals isDarwinHost [
      "-display"
      "cocoa,zoom-to-fit=on"
    ];

    vcpu = 4;
    mem = 8192;

    # On a NixOS host, the guest can share the host's real /nix/store
    # (same OS/arch) instead of building a duplicate store image.
    shares = lib.optional (!isDarwinHost) {
      source = "/nix/store";
      mountPoint = "/nix/.ro-store";
      tag = "ro-store";
      proto = "virtiofs";
    };

    interfaces = [
      {
        type = "user";
        id = "vm-net";
        mac = "02:00:00:00:00:01";
      }
    ];

    preStart = ''
      mkdir -p ${stateDir}
    '';

    volumes = [
      {
        image = stateImage;
        mountPoint = "/";
        size = 32768;
      }
    ];

    writableStoreOverlay = "/nix/.rw-store";
  };

  nix.optimise.automatic = lib.mkForce false;
  nix.gc.automatic = lib.mkForce false;

  hardware.graphics.enable = true;
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;
  services.spice-vdagentd.enable = true;

  services.displayManager.autoLogin = {
    enable = true;
    user = config.my.user.name;
  };
  my.user.hashedPassword = "";

  security.pam.services.cosmic-greeter.enableGnomeKeyring = true;

  security.sudo.wheelNeedsPassword = false;
}
