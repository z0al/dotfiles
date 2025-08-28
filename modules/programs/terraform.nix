{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.terraform;
in

{
  options.my.programs.terraform = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.my.presets.devOps.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      terraform
    ];
  };
}
