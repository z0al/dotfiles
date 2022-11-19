let
  aliases = {
    ga = "g add .";
    gb = "g branch";
    gcm = "g commit -m \"";
    gco = "g checkout";
    gl = "g log";
    gs = "g status";
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

      extraConfig = {
        init.defaultBranch = "main";

        log = {
          decorate = true;
          abbrevCommit = true;
          date = "format-local:%b %d, %Y";
        };

        format.pretty = "fancy";
        pretty.fancy = "%C(bold blue)%h%C(reset) %C(bold green)%ad%C(reset) %C(white)%<(50,trunc)%s%C(reset) %C(magenta)%an%C(reset)";
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
