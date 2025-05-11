{ lib, ... }:

let
  mkBool = default: lib.mkOption {
    type = lib.types.bool;
    default = default;
  };
in

{
  # group related modules under a single flag for convenience.
  options.my.presets = {
    copilot.enable = mkBool true;
    typescript.enable = mkBool true;
    lua.enable = mkBool true;
    nix.enable = mkBool true;

    # Per machine
    go.enable = mkBool false;
    python.enable = mkBool false;
    rust.enable = mkBool false;
    react-native.enable = mkBool false;

    # docker, k8s, terraform ..etc
    devOps.enable = mkBool false;

    # For: Corporate programs e.g. Zoom, Slack, etc.
    business.enable = mkBool false;

    # For: Gaming related programs e.g. Steam
    gaming.enable = mkBool false;
  };
}
