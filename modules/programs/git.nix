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
    ];

    environment.shellAliases = {
      g = "git status";
      gcm = "git commit -m";
      gp = "git pull";
      gP = "git push";
    };

    my.hm.config = {
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
