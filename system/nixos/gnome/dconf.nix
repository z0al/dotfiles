{ pkgs, lib, theme, ... }:

let
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
  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = wallpaper;
      picture-uri-dark = wallpaper;
    };

    "org/gnome/desktop/screensaver" = {
      picture-uri = wallpaper;
    };
  };

  # Load other settings
  home.activation = {
    loadDconfSettings = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      $DRY_RUN_CMD ${pkgs.dconf}/bin/dconf load / < ${./dconf.ini}
    '';
  };
}
