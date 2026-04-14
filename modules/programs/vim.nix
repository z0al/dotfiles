{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.vim;
in

{
  options.my.programs.vim = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      neovim
    ];

    environment.shellAliases = {
      vim = "nvim";
    };

    environment.variables = {
      EDITOR = "nvim";
    };
  };
}
