{ lib, ... }:

with lib.hm.gvariant;

let
  GTK = "org/gtk";
  GTK4 = "${GTK}/gtk4";

  fileChooser = {
    date-format = "regular";
    location-mode = "path-bar";
    show-hidden = mkVariant true;
    show-size-column = mkVariant true;
    show-type-column = mkVariant true;
    sort-column = "name";
    sort-directories-first = mkVariant true;
    sort-order = "ascending";
    type-format = "category";
  };
in

{
  dconf.settings = {
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:";
      focus-mode = "click";
      auto-raise = mkVariant false;
      resize-with-right-button = mkVariant false;
    };

    "org/gnome/desktop/interface" = {
      clock-show-date = mkVariant true;
      clock-show-weekday = mkVariant true;
      color-scheme = "prefer-dark";
      text-scaling-factor = 1.2;
      enable-hot-corners = mkVariant false;
    };

    "org/gnome/shell/extensions/rounded-window-corners" = {
      skip-libadwaita-app = mkVariant true;
      skip-libhandy-app = mkVariant false;

      global-rounded-corner-settings = [
        (mkDictionaryEntry [
          "padding"
          (mkVariant [
            (mkDictionaryEntry [ "top" (mkVariant 1) ])
            (mkDictionaryEntry [ "left" (mkVariant 1) ])
            (mkDictionaryEntry [ "right" (mkVariant 1) ])
            (mkDictionaryEntry [ "bottom" (mkVariant 1) ])
          ])
        ])

        (mkDictionaryEntry [
          "keep_rounded_corners"
          (mkVariant [
            (mkDictionaryEntry [ "maximized" (mkVariant true) ])
            (mkDictionaryEntry [ "fullscreen" (mkVariant false) ])
          ])
        ])

        (mkDictionaryEntry [ "border_radius" (mkVariant 8) ])
        (mkDictionaryEntry [ "smoothing" (mkVariant 1) ])
        (mkDictionaryEntry [ "enabled" (mkVariant true) ])
      ];
    };

    "${GTK}/settings/file-chooser" = fileChooser;
    "${GTK4}/settings/file-chooser" = fileChooser;

    # Gnome Tweaks
    "org/gnome/tweaks" = {
      show-extensions-notice = mkVariant false;
    };
  };
}
