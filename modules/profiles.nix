{ config, lib, ... }:

let
  cfg = config.d.profiles;

  mkBool = default: lib.mkOption {
    type = lib.types.bool;
    default = default;
  };
in

{
  # Profiles group related modules under a single flag for convenience.
  options.d.profiles = {
    # For: Developers. Developers. Developers :)
    dev = {
      enable = mkBool true;

      js.enable = mkBool cfg.dev.enable;

      # Per machine
      go.enable = mkBool false;
      py.enable = mkBool false;
      rust.enable = mkBool false;
    };

    # For: Corporate programs e.g. Zoom, Slack, etc.
    business.enable = mkBool false;

    # For: Gaming related programs e.g. Steam
    gaming.enable = mkBool false;
  };
}
