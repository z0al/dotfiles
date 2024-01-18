{ config, options, inputs, lib, version, user, theme, ... }:

with lib;

let
  cfg = config.d.hm;
in

{
  options.d.hm = mkOption {
    type = types.listOf types.deferredModule;
    default = [ ];
  };

  config = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      extraSpecialArgs = {
        inherit version user theme;
      };

      users.${user} = {
        imports = cfg ++ [
          inputs.nix-index.hmModules.nix-index
          ../home
        ];
      };
    };
  };
}
