{ pkgs, user, ... }:

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

      userName = user;
      userEmail = "${user}@users.noreply.github.com";

      # Signing is done via the 1Password app
      signing = {
        signByDefault = true;
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICINRjw8qGiYwNcKWWwiqcO1fV1ZbCfrvKBI+i/xjJ0e";
      };

      extraConfig = {
        init.defaultBranch = "main";

        log = {
          decorate = true;
          abbrevCommit = true;
        };

        pull.rebase = true;
        push.autoSetupRemote = true;
      };
    };
  };
}
