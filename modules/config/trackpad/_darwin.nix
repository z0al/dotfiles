{ config, ... }:

let
  cfg = config.my.trackpad;
in

{
  plist.trackpad = {
    speed = 2.4;
    draggingStyle = "three-fingers";
    tapToClick = cfg.tapToClick;
    naturalScrolling = cfg.naturalScrolling;
  };
}
