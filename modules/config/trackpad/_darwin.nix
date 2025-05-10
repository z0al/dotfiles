{ config, ... }:

let
  cfg = config.d.trackpad;
in

{
  plist.trackpad = {
    speed = 2.4;
    draggingStyle = "three-fingers";
    tapToClick = cfg.tapToClick;
    naturalScrolling = cfg.naturalScrolling;
  };

  homebrew.casks = [
    "scroll-reverser"
  ];
}
