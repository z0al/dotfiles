{ lib, inputs, ... }:

{
  flake.overlays.default = lib.composeManyExtensions (
    with inputs; [
      fenix.overlays.default
      vscode.overlays.default
    ]
  );
}
