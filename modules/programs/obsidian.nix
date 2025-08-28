{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.obsidian;
in

{
  options.my.programs.obsidian = with lib; {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      obsidian
    ];
  };
}
