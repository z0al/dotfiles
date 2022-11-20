{ lib, theme, ... }:

let
  aliases = {
    g = "git status";
    ga = "git add .";
    gcm = "git commit";
    gco = "git checkout";
    gd = "git diff";
    gl = "git log";
    grs = "git restore";
    gs = "git xswitch";
    gv = "git show --format=medium";
  };
in
{
  programs = {
    bash.shellAliases = aliases;
    fish.shellAbbrs = aliases;

    git = {
      enable = true;

      userName = "z0al";
      userEmail = "z0al@users.noreply.github.com";

      signing = {
        key = "DD0C59367BABDC35";
        signByDefault = true;
      };

      aliases = {
        xswitch = "!git branch -a --format='%(refname:short)' | sed 's~origin/~~' | sed '/HEAD/d' | sort | uniq | fzf | xargs git checkout";
      };

      extraConfig = {
        init.defaultBranch = "main";

        log = {
          decorate = true;
          abbrevCommit = true;
          date = "format-local:%b %d, %Y";
        };

        format.pretty = "github";
        pretty.github = "%C(bold blue)%h%C(reset) %C(bold green)%ad%C(reset) %C(white)%<(50,trunc)%s%C(reset) %C(magenta)%an%C(reset)";
      };

      # https://dandavison.github.io/delta
      delta = {
        enable = true;

        options = {
          line-numbers = true;
          # Note: compatible with Bat themes
          syntax-theme = lib.toLower theme;
          hunk-header-style = "omit";
        };
      };
    };
  };
}
