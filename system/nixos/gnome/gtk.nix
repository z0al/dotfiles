{ pkgs, lib, theme, ... }:

let
  GTK = "org/gtk";
  GTK4 = "${GTK}/gtk4";

  fileChooser = {
    show-hidden = true;
    sort-column = "name";
    sort-directories-first = true;
  };

  # GTK Theme
  gtkThemes = {
    catppuccin = {
      name = "Catppuccin-Mocha-Standard-Mauve-Dark";
      package = pkgs.catppuccin-gtk;
    };
  };

  gtkTheme = gtkThemes.${theme};
  gtkThemeDir = "${gtkTheme.package}/share/themes/${gtkTheme.name}";

  # Cursor Theme
  cursorThemes = {
    catppuccin = {
      name = "Catppuccin-Mocha-Dark-Cursors";
      package = pkgs.catppuccin-cursors.mochaDark;
    };
  };

  cursorTheme = cursorThemes.${theme};

  wallpaper = "${./wallpaper.jpg}";
in

{
  gtk.enable = true;

  ## Theme
  gtk.theme = gtkTheme;

  dconf.settings = {
    "org/gnome/shell/extensions/user-theme" = {
      name = gtkTheme.name;
    };
  };

  xdg.configFile = {
    "gtk-4.0/assets".source = "${gtkThemeDir}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${gtkThemeDir}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${gtkThemeDir}/gtk-4.0/gtk-dark.css";
  };

  gtk.cursorTheme = cursorTheme;

  ## Background
  dconf.settings."org/gnome/desktop/background" = {
    picture-uri = wallpaper;
    picture-uri-dark = wallpaper;
  };
  dconf.settings."org/gnome/desktop/screensaver" = {
    picture-uri = wallpaper;
  };

  ## Interface
  dconf.settings."org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
    clock-show-date = true;
    clock-show-weekday = true;
    text-scaling-factor = 1.2;
  };

  ## Windows
  dconf.settings."org/gnome/desktop/wm/preferences" = {
    button-layout = "appmenu:";
  };

  ## File Chooser
  # Affects the Files app and "Open .." dialogs
  dconf.settings."${GTK}/settings/file-chooser" = fileChooser;
  dconf.settings."${GTK4}/settings/file-chooser" = fileChooser;
}
