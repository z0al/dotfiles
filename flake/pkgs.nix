{ self, lib, inputs, ... }:

let
  config = {
    allowUnfree = true;
  };

  overlays = [ self.overlays.default ];
in

{
  perSystem = { system, ... }: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system config;

      overlays = overlays ++ [
        (final: prev: {
          unstable = import inputs.nixpkgs-unstable {
            inherit system config overlays;
          };
        })
      ];
    };
  };
}
