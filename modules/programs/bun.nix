{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.bun;
in

{
  options.my.programs.bun = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.my.presets.typescript.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      bun
    ];
  };
}
