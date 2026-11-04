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
        quitOnTopLevelReturn = true;
        notARepository = "quit";

        git.overrideGpg = true;

        update.method = "never";

        gui = {
          sidePanels = [
            [ "status" ]
            [
              "files"
              "branches"
              "commits"
            ]
          ];
          showRandomTip = false;
          showCommandLog = false;
          showBottomLine = false;
          showPanelJumps = false;
          showListFooter = false;
        };
      };
    };

    home.shellAliases = {
      gg = lib.getExe pkgs.lazygit;
    };
  };
}
