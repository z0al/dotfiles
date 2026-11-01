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

        git.overrideGpg = true;

        gui = {
          screenMode = "half";
          showRandomTip = false;
          showCommandLog = false;
          showBottomLine = false;
          showPanelJumps = false;
          showListFooter = false;
        };
      };
    };

    home.shellAliases = {
      lz = lib.getExe pkgs.lazygit;
    };
  };
}
