{ lib, ... }:

{
  programs.dbeaver = {
    enable = lib.mkDefault false;

    settings = {
      "org.jkiss.dbeaver.core" = {
        "ui.auto.update.check" = "false";
        "navigator.settings.default.preset" = "simple";
      };
      "org.jkiss.dbeaver.ui.statistics" = {
        "feature.tracking.enabled" = "false";
      };
      "org.eclipse.e4.ui.css.swt.theme" = {
        themeid = "org.eclipse.e4.ui.css.theme.e4_dark";
      };
    };
  };
}
