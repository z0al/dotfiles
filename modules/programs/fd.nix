{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.fd;
in

{
  options.my.programs.fd = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      fd
    ];
  };
}
