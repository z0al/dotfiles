{ config, pkgs, lib, ... }:

let
  cfg = config.my.programs.git;

  settings = {
    user = {
      name = config.my.user.name;
      email = config.my.user.email;

      # Don't guess user.name or user.email if not set
      useConfigOnly = true;
    };

    init.defaultBranch = "main";

    # Signing
    gpg.format = "ssh";
    user.signingKey = config.my.user.sshKey;

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
in

{
  options.my.programs.git = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };

    settings = mkOption {
      type = types.attrsOf types.anything;
      default = { };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      git
    ];

    environment.shellAliases = {
      g = "git status";
      gcm = "git commit -m";
      gp = "git pull";
      gP = "git push";
    };

    my.programs.git.settings = settings;

    xdg.configFile."git/config".text = lib.generators.toGitINI cfg.settings;
  };
}
