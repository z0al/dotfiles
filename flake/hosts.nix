{ self, lib, inputs, ... }:

let
  user = "z0al";
  theme = "catppuccin";
  version = "24.05";

  mkHosts = dir:
    lib.listToAttrs (map
      (file:
        let
          platform =
            if lib.hasInfix "nixos" file
            then "nixos"
            else "darwin";

          system =
            if platform == "nixos"
            then "x86_64-linux" else "aarch64-darwin";

          hostName = with lib; (
            removeSuffix ".nix" (baseNameOf file)
          );

          builder = (with inputs;
            if platform == "nixos"
            then stable.lib.nixosSystem else darwin.lib.darwinSystem
          );

          platformModules = with inputs;
            if platform == "nixos"
            then [ persistence.nixosModule ] else [ ];

          modules = with inputs; [
            {
              networking = { inherit hostName; };
              nixpkgs = {
                config.allowUnfree = true;
                overlays = [ self.overlays.default ];
              };
            }
            hm."${platform}Modules".home-manager

            ../modules
            ../modules/${platform}.nix

            # Legacy
            ../system
            ../system/${platform}
          ] ++ platformModules;
        in
        {
          name = hostName;
          value = builder {
            inherit system modules;

            specialArgs = {
              inherit inputs user theme version;
            };
          };
        })
      (lib.filesystem.listFilesRecursive dir));
in
{
  flake = {
    nixosConfigurations = mkHosts ../hosts/nixos;
    darwinConfigurations = mkHosts ../hosts/darwin;
  };
}
