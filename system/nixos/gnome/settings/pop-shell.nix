{ lib, ... }:

with lib.hm.gvariant;

{
  xdg.configFile."pop-shell/config.json".text = builtins.toJSON {
    float = [{
      class = "1Password";
      title = "Settings";
    }];

    skiptaskbarhidden = [ ];
    log_on_focus = false;
  };

  dconf.settings."org/gnome/shell/extensions/pop-shell" = {
    activate-launcher = [ ];
    active-hint-border-radius = mkUint32 12;
    active-hint = true;
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
    show-skip-taskbar = true;
    show-title = false;
    smart-gaps = false;
    snap-to-grid = false;
    stacking-with-mouse = true;
    tile-accept = [ "Return" ];
    tile-by-default = true;
    tile-enter = [ "<Super>Return" ];
    tile-move-down-global = [ ];
    tile-move-down = [ "Down" ];
    tile-move-left-global = [ ];
    tile-move-left = [ "Left" ];
    tile-move-right-global = [ ];
    tile-move-right = [ "Right" ];
    tile-move-up-global = [ ];
    tile-move-up = [ "Up" ];
    tile-orientation = [ "<Super>o" ];
    tile-reject = [ "Escape" ];
    tile-resize-down = [ "<Shift>Down" ];
    tile-resize-left = [ "<Shift>Left" ];
    tile-resize-right = [ "<Shift>Right" ];
    tile-resize-up = [ "<Shift>Up" ];
    tile-swap-down = [ "<Super>Down" ];
    tile-swap-left = [ "<Super>Left" ];
    tile-swap-right = [ "<Super>Right" ];
    tile-swap-up = [ "<Super>Up" ];
    toggle-floating = [ "<Super>g" ];
    toggle-stacking-global = [ "<Super>s" ];
    toggle-stacking = [ "s" ];
    toggle-tiling = [ "<Super>y" ];
  };
}
