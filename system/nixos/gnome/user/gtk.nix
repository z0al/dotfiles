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
  gtk = {
    enable = true;

    # Use Dark mode for Legacy apps
    theme = {
      name = "Adwaita-dark";
    };
  };

  # File Chooser
  # Affects the Files app and "Open .." dialogs
  dconf.settings."${GTK}/settings/file-chooser" = file-chooser;
  dconf.settings."${GTK4}/settings/file-chooser" = file-chooser;
}
