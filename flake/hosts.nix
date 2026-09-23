{
  self,
  lib,
  inputs,
  withSystem,
  ...
}:

let
  cfgNixos = {
    isNixos = true;
    system = "aarch64-linux";
    builder = inputs.nixpkgs.lib.nixosSystem;
    modules = [ self.nixosModules.default ];
  };

  cfgDarwin = {
    isNixos = false;
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

              modules =
                cfg.modules
                ++ lib.optionals cfg.isNixos [
                  { nixpkgs.pkgs = pkgs; }
                ]
                ++ [
                  module
                  { networking = { inherit hostName; }; }
                ];

              specialArgs = {
                inherit inputs;
              }
              // lib.optionalAttrs (!cfg.isNixos) { inherit pkgs; };
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
}
