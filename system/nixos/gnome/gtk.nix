{ pkgs, lib, theme, ... }:

let
  GTK = "org/gtk";
  GTK4 = "${GTK}/gtk4";

  fileChooser = {
    show-hidden = true;
    sort-column = "name";
    sort-directories-first = true;
  };

  themes = {
    catppuccin = {
      name = "Catppuccin-Mocha-Standard-Pink-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "pink" ];
        size = "standard";
        tweaks = [ ];
        variant = "mocha";
      };
    };
  };

  gtkTheme = themes.${theme};
  gtkThemeDir = "${gtkTheme.package}/share/themes/${gtkTheme.name}";
in

{
  gtk.enable = true;

  # Theme
  gtk.theme = gtkTheme;
  xdg.configFile = {
    "gtk-4.0/assets".source = "${gtkThemeDir}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${gtkThemeDir}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${gtkThemeDir}/gtk-4.0/gtk-dark.css";
  };

  # Interface
  dconf.settings."org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
    clock-show-date = true;
    clock-show-weekday = true;
  };

  # Windows
  dconf.settings."org/gnome/desktop/wm/preferences" = {
    button-layout = "appmenu:";
  };

  # File Chooser
  # Affects the Files app and "Open .." dialogs
  dconf.settings."${GTK}/settings/file-chooser" = fileChooser;
  dconf.settings."${GTK4}/settings/file-chooser" = fileChooser;
}
