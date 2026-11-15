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

  cfgHome = {
    system = "x86_64-linux";
    builder =
      {
        pkgs,
        modules,
        specialArgs,
        ...
      }:
      inputs.hm.lib.homeManagerConfiguration {
        inherit pkgs modules;
        extraSpecialArgs = specialArgs;
      };
    modules = [ self.homeModules.default ];
  };

  mkHosts =
    cfg: dir:
    lib.listToAttrs (
      map (
        module:
        let
          hostName = lib.removeSuffix ".nix" (baseNameOf module);
        in
        {
          name = hostName;
          value = withSystem cfg.system (
            { pkgs, ... }:
            cfg.builder {
              inherit (cfg) system;
              inherit pkgs;
              lib = inputs.nixpkgs.lib;
              modules = cfg.modules ++ [ module ];
              specialArgs = { inherit inputs hostName; };
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
    homeConfigurations = mkHosts cfgHome ../hosts/home;
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
