{ lib, inputs, ... }:

let
  pkgsLatest = final: prev: {
    latest = import inputs.latest {
      inherit (final) system;
      config.allowUnfree = true;
    };
  };
in

{
  flake.overlays.default = lib.composeManyExtensions (
    with inputs; [
      pkgsLatest
      fenix.overlays.default
      vscode-extensions.overlays.default
    ]
  );
}
