{ lib, inputs, ... }:

{
  flake.overlays.default = lib.composeManyExtensions (
    with inputs; [
      vscode.overlays.default
    ]
  );
}
