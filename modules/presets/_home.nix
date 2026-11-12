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
    typescript.enable = mkBool true;
    lua.enable = mkBool true;
    nix.enable = mkBool true;

    # Per machine
    go.enable = mkBool false;
    python.enable = mkBool false;
    rust.enable = mkBool false;
    react-native.enable = mkBool false;
  };
}
