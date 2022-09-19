{ ... }:

{
  programs = {
    git = {
      enable = true;

      userName = "Ahmed T. Ali";
      userEmail = "z0al@users.noreply.github.com";

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

      extraConfig = {
        init.defaultBranch = "main";
        credential.helper = "store";
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
