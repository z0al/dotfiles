{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.aws;
in

{
  options.my.programs.aws = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.my.presets.devOps.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      awscli2
    ];
  };
}
