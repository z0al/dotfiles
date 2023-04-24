{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings."org/gnome/shell/extensions/pop-shell" = {
    activate-launcher = [ ];
    active-hint-border-radius = mkUint32 12;
    active-hint = mkVariant true;
    column-size = mkUint32 64;
    focus-down = [ "<Super>Down" ];
    focus-left = [ "<Super>Left" ];
    focus-right = [ "<Super>Right" ];
    focus-up = [ "<Super>Up" ];
    fullscreen-launcher = false;
    gap-inner = mkUint32 2;
    gap-outer = mkUint32 2;
    hint-color-rgba = "rgba(250, 179, 135, 1)";
    log-level = mkUint32 0;
    management-orientation = [ "o" ];
    mouse-cursor-focus-location = mkUint32 4;
    mouse-cursor-follows-active-window = false;
    pop-monitor-down = [ ];
    pop-monitor-left = [ ];
    pop-monitor-right = [ ];
    pop-monitor-up = [ ];
    pop-workspace-down = [ ];
    pop-workspace-up = [ ];
    row-size = mkUint32 64;
    show-skip-taskbar = mkVariant true;
    show-title = false;
    smart-gaps = false;
    snap-to-grid = false;
    stacking-with-mouse = mkVariant true;
    tile-accept = [ "Return" ];
    tile-by-default = mkVariant true;
    tile-enter = [ "<Super>r" ];
    tile-move-down-global = [ "<Shift><Super>Down" ];
    tile-move-down = [ "<Shift><Super>Down" ];
    tile-move-left-global = [ "<Shift><Super>Left" ];
    tile-move-left = [ "<Shift><Super>Left" ];
    tile-move-right-global = [ "<Shift><Super>Right" ];
    tile-move-right = [ "<Shift><Super>Right" ];
    tile-move-up-global = [ "<Shift><Super>Up" ];
    tile-move-up = [ "<Shift><Super>Up" ];
    tile-orientation = [ "<Super>o" ];
    tile-reject = [ "Escape" ];
    tile-resize-down = [ "<Shift>Down" ];
    tile-resize-left = [ "<Shift>Left" ];
    tile-resize-right = [ "<Shift>Right" ];
    tile-resize-up = [ "<Shift>Up" ];
    tile-swap-down = [ ];
    tile-swap-left = [ ];
    tile-swap-right = [ ];
    tile-swap-up = [ ];
    toggle-floating = [ "<Super>f" ];
    toggle-stacking-global = [ "<Super>s" ];
    toggle-stacking = [ "<Super>s" ];
    toggle-tiling = [ "<Super>e" ];
  };
}
