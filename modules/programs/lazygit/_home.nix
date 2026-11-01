{
  config,
  lib,
  pkgs,
  ...
}:

{
  config = {
    programs.lazygit = {
      enable = lib.mkDefault config.programs.git.enable;

      settings = {
        disableStartupPopups = true;
      };
    };

    home.shellAliases = {
      lz = lib.getExe pkgs.lazygit;
    };
  };
}
