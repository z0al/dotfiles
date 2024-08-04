{ self, inputs, ... }:

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
        (_final: _prev: {
          unstable = import inputs.nixpkgs-unstable {
            inherit system config overlays;
          };
        })
      ];
    };
  };
}
