{ lib, inputs, ... }:

{
  flake.overlays.default = lib.composeManyExtensions (
    with inputs; [
      # (final: prev: {
      #   ...
      # })
      helix.overlays.default
      vscode.overlays.default
    ]
  );
}
