{ pkgs, lib, theme, user, ... }:

let
  aliases = {
    g = "git status";
    ga = "git add .";
    gcm = "git commit -m";
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

      userName = user;
      userEmail = "${user}@users.noreply.github.com";

      # Signing is done via the 1Password app
      signing = {
        signByDefault = true;
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICINRjw8qGiYwNcKWWwiqcO1fV1ZbCfrvKBI+i/xjJ0e";
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

    # https://github.com/jesseduffield/lazygit
    lazygit = {
      enable = true;

      settings = {
        git.paging = {
          colorArg = "always";
          pager = "${pkgs.delta}/bin/delta --dark --paging=never";
        };
      };
    };
  };
}
