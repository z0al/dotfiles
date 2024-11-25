{ lib, inputs, ... }:

{
  flake.overlays.default = lib.composeManyExtensions (
    with inputs; [
      # (final: prev: {
      #   ...
      # })
      vscode.overlays.default
    ]
  );
}
