{ config, pkgs, user, ... }:

let
  aliases = {
    g = "git status";
    ga = "git add .";
    gcm = "git commit -m";
    gco = "git checkout";
    gd = "git diff";
    gl = "git log";
    grs = "git restore";
    gs = "git switch";
    gp = "git pull";
    gP = "git push";
  };
in

{
  imports = [
    ./delta.nix
    ./ui.nix
  ];

  programs = {
    bash.shellAliases = aliases;
    fish.shellAbbrs = aliases;

    git = {
      enable = true;

      userName = "z0al";
      userEmail = "z0al@users.noreply.github.com";

      # Signing is done via the 1Password app
      signing = {
        signByDefault = true;
        key = config.d.apps.onepassword.ssh.key;
      };

      extraConfig = {
        init.defaultBranch = "main";

        gpg = {
          format = "ssh";
          ssh.program = config.d.apps.onepassword.ssh.sign;
        };

        log = {
          decorate = true;
          abbrevCommit = true;
        };

        pull.rebase = false;

        # Autostash on "git pull ..."
        merge.autoStash = true;
        rebase.autoStash = true;

        push.autoSetupRemote = true;
      };
    };
  };
}
