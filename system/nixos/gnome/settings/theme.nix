{ pkgs, theme, ... }:

let
  cursorThemes = {
    catppuccin = {
      name = "Catppuccin-Mocha-Dark-Cursors";
      package = pkgs.catppuccin-cursors.mochaDark;
    };
  };

  cursorTheme = cursorThemes.${theme};

  gtkThemes = {
    catppuccin = {
      name = "Catppuccin-Mocha-Standard-Lavender-Dark";
      package = pkgs.catppuccin-gtk;
    };
  };

  gtkTheme = gtkThemes.${theme};
  gtkThemeDir = "${gtkTheme.package}/share/themes/${gtkTheme.name}";
in

{
  gtk.enable = true;
  gtk.theme = gtkTheme;
  gtk.cursorTheme = cursorTheme;

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
}
