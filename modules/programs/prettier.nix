{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.prettier;
in

{
  options.my.programs.prettier = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };

    package = mkOption {
      type = types.package;
      default = pkgs.nodePackages.prettier;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      cfg.package
    ];
  };
}
