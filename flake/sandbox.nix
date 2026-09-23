{ inputs, self, ... }:
let
  darwinPkgs = inputs.nixpkgs.legacyPackages.aarch64-darwin;
  sandbox = inputs.nixpkgs.lib.nixosSystem {
    system = "aarch64-linux";
    modules = [
      (
        { modulesPath, pkgs, ... }:
        {
          imports = [ "${modulesPath}/virtualisation/qemu-vm.nix" ];

          networking.hostName = "sandbox";
          system.stateVersion = "26.05";

          virtualisation = {
            host.pkgs = darwinPkgs;
            graphics = false;
            cores = 2;
            memorySize = 2048;
            diskImage = null;
            writableStore = true;
            writableStoreUseTmpfs = true;
          };

          services.getty.autologinUser = "root";
          environment.systemPackages = with pkgs; [
            curl
            git
          ];
        }
      )
    ];
  };
in
{
  flake.nixosConfigurations.sandbox = sandbox;

  perSystem =
    { system, ... }:
    inputs.nixpkgs.lib.optionalAttrs (system == "aarch64-darwin") {
      apps.sandbox = {
        type = "app";
        program = "${sandbox.config.system.build.vm}/bin/run-nixos-vm";
      };
    };
}
