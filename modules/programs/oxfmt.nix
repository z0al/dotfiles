{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.oxfmt;
in

{
  options.my.programs.oxfmt = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.my.presets.typescript.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      oxfmt
    ];

    environment.shellAliases = {
      prettier = "oxfmt";
    };
  };
}
