{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.rustup;
  cfgDataHome = config.xdg.dataHome;
in

{
  options.my.programs.rustup = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.my.presets.rust.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.variables = {
      CARGO_HOME = "${cfgDataHome}/cargo";
      RUSTUP_HOME = "${cfgDataHome}/rustup";
    };

    environment.systemPackages = with pkgs; [
      rustup
    ];
  };
}
