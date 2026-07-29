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
        git.paging.colorArg = "always";
      };
    };

    home.shellAliases = {
      lz = lib.getExe pkgs.lazygit;
    };
  };
}
