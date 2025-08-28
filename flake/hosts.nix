{
  self,
  lib,
  inputs,
  withSystem,
  ...
}:

let
  cfgNixos = {
    system = "x86_64-linux";
    builder = inputs.nixpkgs.lib.nixosSystem;
    modules = [ self.nixosModules.default ];
  };

  cfgDarwin = {
    system = "aarch64-darwin";
    builder = inputs.darwin.lib.darwinSystem;
    modules = [ self.darwinModules.default ];
  };

  mkHosts =
    dir:
    lib.listToAttrs (
      map (
        module:
        let
          cfg = if lib.hasInfix "nixos" module then cfgNixos else cfgDarwin;

          hostName = with lib; (removeSuffix ".nix" (baseNameOf module));
        in
        {
          name = hostName;
          value = withSystem cfg.system (
            { pkgs, ... }:
            cfg.builder {
              inherit (cfg) system;

              modules = cfg.modules ++ [
                module
                { networking = { inherit hostName; }; }
              ];

              specialArgs = {
                inherit pkgs inputs;
              };
            }
          );
        }
      ) (lib.filesystem.listFilesRecursive dir)
    );
in
{
  flake = {
    nixosConfigurations = mkHosts ../hosts/nixos;
    darwinConfigurations = mkHosts ../hosts/darwin;
  };
}
