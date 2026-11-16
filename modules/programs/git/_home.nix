let
  aliases = {
    g = "git status";
    ga = "git add .";
    gcm = "git commit -m";
    gp = "git pull";
    gP = "git push";
  };
in

{
  config = {
    programs.git = {
      settings = {
        user = {
          name = "z0al";
          email = "12673605+z0al@users.noreply.github.com";

          # Don't guess user.name or user.email if not set
          useConfigOnly = true;
        };

        init.defaultBranch = "main";

        # Signing
        gpg.format = "ssh";

        commit.gpgSign = true;
        tag = {
          gpgSign = true;
          sort = "version:refname";
        };

        log = {
          decorate = true;
          abbrevCommit = true;
        };

        pull.rebase = false;

        # Autostash on "git pull ..."
        merge.autoStash = true;
        rebase = {
          autoStash = true;
          autoSquash = true;
          updateRefs = true;
        };

        push = {
          autoSetupRemote = true;
          default = "simple";
          followTags = true;
        };

        fetch = {
          prune = true;
          pruneTags = true;
          all = true;
        };

        diff = {
          algorithm = "histogram";
          colorMoved = "plain";
          renames = true;
        };

        branch.sort = "-committerdate";
        column.ui = "auto";

        commit.verbose = true;
        help.autocorrect = "prompt";
        rerere = {
          enabled = true;
          autoupdate = true;
        };

        # Force use SSH for GitHub
        url."ssh://git@github.com".insteadof = "https://github.com";
      };
    };

    home.shellAliases = aliases;
    programs.fish.shellAbbrs = aliases;
  };
}
