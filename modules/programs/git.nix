{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.git;
in

{
  options.d.programs.git = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      git
      git-ignore
    ];

    environment.shellAliases = {
      g = "git status";
      ga = "git add .";
      gcm = "git commit -m";
      gco = "git checkout";
      gl = "git log";
      gp = "git pull";
      gP = "git push";
    };

    my.user = {
      programs.git = {
        enable = true;

        userName = config.d.git.user;
        userEmail = config.d.git.email;

        signing.signByDefault = true;
        signing.key = config.d.user.ssh.key;

        extraConfig = {
          init.defaultBranch = "main";

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
  };
}
