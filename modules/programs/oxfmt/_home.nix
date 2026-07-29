{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.oxfmt;
in

{
  options.programs.oxfmt.enable = lib.mkOption {
    type = lib.types.bool;
    default = config.presets.typescript.enable;
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.oxfmt ];

    home.shellAliases = {
      prettier = "oxfmt";
    };
  };
}
