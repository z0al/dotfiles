{ osConfig, config, pkgs, ... }:

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
  home.packages = with pkgs; [
    git-ignore
  ];

  programs = {
    fish.shellAbbrs = aliases;

    git = {
      enable = true;

      userName = osConfig.d.git.user;
      userEmail = osConfig.d.git.email;

      signing.signByDefault = true;
      signing.key = osConfig.d.user.ssh.key;

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
}
