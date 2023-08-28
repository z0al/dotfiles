{ lib, ... }:

with lib.hm.gvariant;

let
  GTK = "org/gtk";
  GTK4 = "${GTK}/gtk4";

  fileChooser = {
    date-format = "regular";
    location-mode = "path-bar";
    show-hidden = true;
    show-size-column = true;
    show-type-column = true;
    sort-column = "name";
    sort-directories-first = true;
    sort-order = "ascending";
    type-format = "category";
  };
in

{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      clock-show-date = true;
      clock-show-weekday = true;
      color-scheme = "prefer-dark";
      text-scaling-factor = 1.2;
      enable-hot-corners = false;
    };

    "org/gnome/desktop/session" = {
      idle-delay = 900; # 15mins
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:";
      focus-mode = "click";
      auto-raise = false;
      resize-with-right-button = false;
    };

    "org/gnome/shell/extensions/rounded-window-corners" = {
      skip-libadwaita-app = true;
      skip-libhandy-app = false;

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
      show-extensions-notice = false;
    };
  };
}
