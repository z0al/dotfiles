{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.rust-analyzer;
in

{
  options.my.programs.rust-analyzer = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.my.presets.rust.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      rust-analyzer
    ];
  };
}
