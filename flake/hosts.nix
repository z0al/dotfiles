{ self, lib, inputs, withSystem, ... }:

let
  theme = "catppuccin";

  mkHosts = dir:
    lib.listToAttrs (map
      (module:
        let
          platform =
            if lib.hasInfix "nixos" module
            then "nixos"
            else "darwin";

          system =
            if platform == "nixos"
            then "x86_64-linux" else "aarch64-darwin";

          hostName = with lib; (
            removeSuffix ".nix" (baseNameOf module)
          );

          builder = (with inputs;
            if platform == "nixos"
            then stable.lib.nixosSystem else darwin.lib.darwinSystem
          );

          platformModule = with inputs;
            if platform == "nixos"
            then self.nixosModules.default
            else self.darwinModules.default;

          modules = with inputs; [
            module
            platformModule
            { networking = { inherit hostName; }; }
          ];
        in
        {
          name = hostName;
          value = withSystem system ({ pkgs, ... }: builder {
            inherit system modules;

            specialArgs = {
              inherit pkgs inputs theme;
            };
          });
        })
      (lib.filesystem.listFilesRecursive dir));
in
{
  flake = {
    nixosConfigurations = mkHosts ../hosts/nixos;
    darwinConfigurations = mkHosts ../hosts/darwin;
  };
}
