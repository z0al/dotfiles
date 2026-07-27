{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.forgit;
in

{
  options.my.programs.forgit = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.my.programs.git.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    my.programs.fzf.enable = true;

    dot.programs.fish.plugins = with pkgs.fishPlugins; [
      {
        name = "forgit";
        src = forgit.src;
      }
    ];

    environment.variables = {
      forgit_log = "gl";
    };
  };
}
