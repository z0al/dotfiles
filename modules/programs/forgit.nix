{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.forgit;
in

{
  options.d.programs.forgit = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.d.programs.git.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    d.programs.fish.plugins = with pkgs.fishPlugins; [
      forgit
    ];

    d.shell.variables = {
      FORGIT_NO_ALIASES = "1";
    };

    d.shell.aliases = {
      g = "git status";
      ga = "git-forgit add";
      gbd = "git-forgit branch_delete";
      gbl = "git-forgit blame";
      gcb = "git-forgit checkout_branch";
      gcf = "git-forgit checkout_file";
      gclean = "git-forgit clean";
      gco = "git-forgit checkout_commit";
      gcp = "git-forgit cherry_pick_from_branch";
      gct = "git-forgit checkout_tag";
      gd = "git-forgit diff";
      gfu = "git-forgit fixup";
      gi = "git-forgit ignore";
      glo = "git-forgit log";
      grb = "git-forgit rebase";
      grc = "git-forgit revert_commit";
      grh = "git-forgit reset_head";
      gsp = "git-forgit stash_push";
      gss = "git-forgit stash_show";
    };
  };
}
