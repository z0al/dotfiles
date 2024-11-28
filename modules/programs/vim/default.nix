{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.vim;
in

{
  options.d.programs.vim = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.nixvim = {
      enable = true;
      package = pkgs.neovim-unwrapped;
    };

    environment.shellAliases = {
      vim = lib.getExe pkgs.neovim-unwrapped;
      vimdiff = "${lib.getExe pkgs.neovim-unwrapped} -d";
    };
  };
}
