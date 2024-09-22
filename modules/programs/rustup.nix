{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.rustup;
  cfgDataHome = config.my.user.xdg.dataHome;
in

{
  options.d.programs.rustup = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.d.presets.rust.enable;
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
