{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.shfmt;
in

{
  options.my.programs.shfmt = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      shfmt
    ];
  };
}
