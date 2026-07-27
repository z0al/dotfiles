{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.forgit;
in

{
  options.programs.forgit.enable = lib.mkOption {
    type = lib.types.bool;
    default = config.programs.git.enable;
  };

  config = lib.mkIf cfg.enable {
    programs.fzf.enable = true;

    programs.fish.plugins = with pkgs.fishPlugins; [
      {
        name = "forgit";
        src = forgit.src;
      }
    ];

    home.sessionVariables = {
      forgit_log = "gl";
    };
  };
}
