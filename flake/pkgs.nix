{ self, lib, inputs, ... }:

let
  config = {
    allowUnfree = true;
  };

  overlays = [ self.overlays.default ];
in

{
  perSystem = { system, ... }: {
    _module.args.pkgs = import inputs.stable {
      inherit system config;

      overlays = overlays ++ [
        (final: prev: {
          latest = import inputs.latest {
            inherit system config overlays;
          };
        })
      ];
    };
  };
}
