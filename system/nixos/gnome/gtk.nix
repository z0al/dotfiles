let
  GTK = "org/gtk";
  GTK4 = "${GTK}/gtk4";

  file-chooser = {
    show-hidden = true;
    sort-column = "name";
    sort-directories-first = true;
  };
in

{
  gtk.enable = true;

  # Dark mode for legacy apps
  gtk.theme.name = "Adwaita-dark";

  # Interface
  dconf.settings."org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
    clock-show-date = true;
    clock-show-weekday = true;
  };

  # Windows
  dconf.settings."org/gnome/desktop/wm/preferences" = {
    button-layout = "appmenu:minimize,close";
  };

  # File Chooser
  # Affects the Files app and "Open .." dialogs
  dconf.settings."${GTK}/settings/file-chooser" = file-chooser;
  dconf.settings."${GTK4}/settings/file-chooser" = file-chooser;
}
