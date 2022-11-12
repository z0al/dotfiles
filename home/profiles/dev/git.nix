{
  programs = {
    git = {
      enable = true;

      userName = "z0al";
      userEmail = "z0al@users.noreply.github.com";

      signing = {
        key = "DD0C59367BABDC35";
        signByDefault = true;
      };

      aliases = {
        ad = "add .";
        br = "branch";
        cm = "commit -m";
        co = "checkout";
        st = "status";
        lg = "log --decorate --format=format:'%C(bold blue)%h%C(reset) %C(bold green)%ah%C(reset) %C(magenta)%an%C(reset) %C(white)%s%C(reset) %C(bold yellow)%d%C(reset)' --all";
      };

      extraConfig = {
        init.defaultBranch = "main";
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
