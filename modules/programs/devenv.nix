{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.devenv;
in

{
  options.my.programs.devenv = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      devenv
    ];
  };
}
