{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.openspec;
in

{
  options.my.programs.openspec = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      openspec
    ];
  };
}
