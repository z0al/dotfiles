{ lib, osConfig, ... }:

{
  config = {
    programs.lazygit = {
      enable = lib.mkDefault osConfig.my.programs.git.enable;

      settings = {
        disableStartupPopups = true;
        git.paging.colorArg = "always";
      };
    };
  };
}
