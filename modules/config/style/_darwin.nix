{ config, ... }:

let
  cfg = config.my.style;
in

{
  plist.appearance.theme = if cfg.dark == true then "dark" else "auto";
}
