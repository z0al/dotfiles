{ lib, ... }:

{
  dconf.settings."org/gnome/shell/extensions/pop-shell" = {
    tile-by-default = true;
    show-title = false;
    gap-outer = 1;
    active-hint = true;
    hint-color-rgba = "rgba(250, 179, 135, 1)";
    active-hint-border-radius = lib.hm.gvariant.mkUint32 12;
  };
}
