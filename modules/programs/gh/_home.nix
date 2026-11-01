{ config, lib, ... }:

let
  cfg = config.programs.gh;
in

{
  config = {
    programs.gh = {
      enable = lib.mkDefault true;
      settings.git_protocol = "ssh";
    };

    # https://developer.1password.com/docs/cli/shell-plugins/github/
    home.shellAliases =
      lib.mkIf (cfg.enable && config.programs._1password.enable)
        {
          gh = "op plugin run -- gh";
        };
  };
}
