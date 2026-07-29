{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.rustup;
in

{
  options.programs.rustup.enable = lib.mkOption {
    type = lib.types.bool;
    default = config.presets.rust.enable;
  };

  config = lib.mkIf cfg.enable {
    home.sessionVariables = {
      CARGO_HOME = "${config.xdg.dataHome}/cargo";
      RUSTUP_HOME = "${config.xdg.dataHome}/rustup";
    };

    home.packages = [ pkgs.rustup ];
  };
}
