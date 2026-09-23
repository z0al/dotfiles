{ inputs, withSystem, ... }:
let
  darwinPkgs = inputs.nixpkgs.legacyPackages.aarch64-darwin;
  sandbox = withSystem "aarch64-linux" (
    { pkgs, ... }:
    inputs.nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        { nixpkgs.pkgs = pkgs; }
        inputs.hm.nixosModules.home-manager
        inputs.microvm.nixosModules.microvm
        ../modules/shared.nix
        ../modules/config/users/_nixos.nix
        ../modules/config/nix/_nixos.nix
        (
          { pkgs, ... }:
          {
            networking.hostName = "sandbox";
            networking.useDHCP = true;
            system.stateVersion = "26.05";

            microvm = {
              hypervisor = "qemu";
              vmHostPackages = darwinPkgs;
              graphics = {
                enable = false;
                backend = "cocoa";
              };
              vcpu = 2;
              mem = 2304;
              interfaces = [
                {
                  type = "user";
                  id = "sandbox-net";
                  mac = "02:00:00:00:00:01";
                }
              ];
              volumes = [ ];
              writableStoreOverlay = "/nix/.rw-store";
            };

            # The VM's root and store overlay are temporary RAM filesystems.
            nix.optimise.automatic = inputs.nixpkgs.lib.mkForce false;
            nix.gc.automatic = inputs.nixpkgs.lib.mkForce false;

            # Keep the usual CLI configuration; desktop apps can be enabled
            # when this guest gets a graphical session.
            my.programs = {
              _1password.enable = false;
              beekeeper-studio.enable = false;
              chrome.enable = false;
              vscode.enable = false;
              wezterm.enable = false;
            };

            services.getty.autologinUser = "z0al";
            security.sudo.wheelNeedsPassword = false;
            environment.systemPackages = with pkgs; [
              curl
              git
            ];
          }
        )
      ];
    }
  );
in
{
  flake.nixosConfigurations.sandbox = sandbox;

  perSystem =
    { system, ... }:
    inputs.nixpkgs.lib.optionalAttrs (system == "aarch64-darwin") {
      apps.sandbox = {
        type = "app";
        program = "${sandbox.config.microvm.declaredRunner}/bin/microvm-run";
      };
    };
}
