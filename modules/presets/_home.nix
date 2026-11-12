{ lib, ... }:

let
  mkBool =
    default:
    lib.mkOption {
      type = lib.types.bool;
      default = default;
    };
in

{
  # group related modules under a single flag for convenience.
  options.presets = {
    lua.enable = mkBool true;
    nix.enable = mkBool true;

    # Per machine
    typescript.enable = mkBool false;
    go.enable = mkBool false;
    python.enable = mkBool false;
    rust.enable = mkBool false;
    react-native.enable = mkBool false;
  };
}
