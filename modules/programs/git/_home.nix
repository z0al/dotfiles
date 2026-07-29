{ lib, ... }:

{
  config = {
    programs.git = {
      enable = lib.mkDefault true;

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
        user.signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICINRjw8qGiYwNcKWWwiqcO1fV1ZbCfrvKBI+i/xjJ0e";

        commit.gpgSign = true;
        tags.gpgSign = true;

        log = {
          decorate = true;
          abbrevCommit = true;
        };

        pull.rebase = false;

        # Autostash on "git pull ..."
        merge.autoStash = true;
        rebase.autoStash = true;

        push.autoSetupRemote = true;

        # Force use SSH for GitHub
        url."ssh://git@github.com".insteadof = "https://github.com";
      };
    };

    home.shellAliases = {
      g = "git status";
      gcm = "git commit -m";
      gp = "git pull";
      gP = "git push";
    };
  };
}
