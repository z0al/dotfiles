let
  prefix = "org/gnome/shell/extensions/blur-my-shell";
in
{
  dconf.settings."${prefix}" = {
    hacks-level = 1;
  };

  dconf.settings."${prefix}/appfolder" = {
    blur = true;
    style-dialogs = 2;
  };

  dconf.settings."${prefix}/applications" = {
    blur = false;
  };

  dconf.settings."${prefix}/dash-to-dock" = {
    blur = false;
  };

  dconf.settings."${prefix}/hidetopbar" = {
    compatibility = false;
  };

  dconf.settings."${prefix}/lockscreen" = {
    blur = false;
  };

  dconf.settings."${prefix}/overview" = {
    style-components = 1;
  };

  dconf.settings."${prefix}/panel" = {
    blur = true;
    customize = false;
    override-background = true;
    override-background-dynamically = false;
    style-panel = 0;
    unblur-in-overview = true;
  };

  dconf.settings."${prefix}/screenshot" = {
    blur = true;
  };

  dconf.settings."${prefix}/window-list" = {
    blur = false;
  };
}
