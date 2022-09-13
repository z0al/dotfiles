{ config, pkgs, ... }:
let
  alias = { g = "git"; };
in
{
  programs = {
    bash.shellAliases = alias;
    fish.shellAbbrs = alias;

    git = {
      enable = true;

      userName = "Ahmed T. Ali";
      userEmail = "z0al@users.noreply.github.com";

      extraConfig = {
        init.defaultBranch = "main";
      };

      signing = {
        key = "DD0C59367BABDC35";
        signByDefault = true;
      };

      aliases = {
        co = "checkout";
        br = "branch";
        st = "status";
        cm = "commit -m";
      };

      # https://dandavison.github.io/delta
      delta = {
        enable = true;

        options = {
          line-numbers = true;
          features = "decorations";
          decorations = {
            hunk-header-style = "omit";
          };
        };
      };
    };
  };
}
