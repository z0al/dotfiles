{ config, lib, ... }:

{
  config = {
    programs.lazygit = {
      enable = lib.mkDefault config.programs.git.enable;

      settings = {
        disableStartupPopups = true;
        git.paging.colorArg = "always";
      };
    };
  };
}
