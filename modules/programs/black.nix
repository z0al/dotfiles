{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.black;
in

{
  options.my.programs.black = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.my.presets.python.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      python3.pkgs.black
    ];
  };
}
