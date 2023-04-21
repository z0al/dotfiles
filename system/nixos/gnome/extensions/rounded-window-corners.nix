{ lib, ... }:

let
  var = lib.hm.gvariant.mkVariant;
  dict = lib.hm.gvariant.mkDictionaryEntry;
in

{
  dconf.settings."org/gnome/shell/extensions/rounded-window-corners" = {
    skip-libadwaita-app = true;
    skip-libhandy-app = false;

    global-rounded-corner-settings = [
      (dict [
        "padding"
        (var [
          (dict [ "top" (var 1) ])
          (dict [ "left" (var 1) ])
          (dict [ "right" (var 1) ])
          (dict [ "bottom" (var 1) ])
        ])
      ])

      (dict [
        "keep_rounded_corners"
        (var [
          (dict [ "maximized" (var true) ])
          (dict [ "fullscreen" (var false) ])
        ])
      ])

      (dict [ "border_radius" (var 8) ])
      (dict [ "smoothing" (var 1) ])
      (dict [ "enabled" (var true) ])
    ];
  };
}
