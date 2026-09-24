{
  self,
  lib,
  inputs,
  withSystem,
  ...
}:

let
  cfgNixos = {
    system = "aarch64-linux";
    builder = inputs.nixpkgs.lib.nixosSystem;
    modules = [ self.nixosModules.default ];
  };

  cfgDarwin = {
    system = "aarch64-darwin";
    builder = inputs.darwin.lib.darwinSystem;
    modules = [ self.darwinModules.default ];
  };

  mkHosts =
    cfg: dir:
    lib.listToAttrs (
      map (
        module:
        let
          hostName = with lib; (removeSuffix ".nix" (baseNameOf module));
        in
        {
          name = hostName;
          value = withSystem cfg.system (
            { pkgs, ... }:
            cfg.builder {
              inherit (cfg) system;

              modules = cfg.modules ++ [
                {
                  nixpkgs.pkgs = pkgs;
                  networking = { inherit hostName; };
                }
                module
              ];

              specialArgs = { inherit inputs; };
            }
          );
        }
      ) (lib.filesystem.listFilesRecursive dir)
    );
in
{
  flake = {
    nixosConfigurations = mkHosts cfgNixos ../hosts/nixos;
    darwinConfigurations = mkHosts cfgDarwin ../hosts/darwin;
  };

  perSystem = { pkgs, ... }: {
    apps.vm = {
      type = "app";
      meta.description = "Launch a NixOS VM";
      program = lib.getExe (
        (self.nixosConfigurations.vm.extendModules {
          modules = [ { microvm.vmHostPackages = pkgs; } ];
        }).config.microvm.declaredRunner
      );
    };
  };
}
