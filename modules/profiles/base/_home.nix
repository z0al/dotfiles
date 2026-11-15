{ config, lib, ... }:

let
  cfg = config.profiles.base;
in

{
  options.profiles.base.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf cfg.enable {
    programs = {
      bash.enable = lib.mkDefault true;
      bat.enable = lib.mkDefault true;
      delta.enable = lib.mkDefault true;
      direnv.enable = lib.mkDefault true;
      fd.enable = lib.mkDefault true;
      fish.enable = lib.mkDefault true;
      fzf.enable = lib.mkDefault true;
      git.enable = lib.mkDefault true;
      lazygit.enable = lib.mkDefault true;
      nix-index.enable = lib.mkDefault true;
      nixvim.enable = lib.mkDefault true;
      nix-your-shell.enable = lib.mkDefault true;
      shfmt.enable = lib.mkDefault true;
      starship.enable = lib.mkDefault true;
      up.enable = lib.mkDefault true;
      zoxide.enable = lib.mkDefault true;
    };
  };
}
