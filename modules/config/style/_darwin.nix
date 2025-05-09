{ config, ... }:

let
  cfg = config.d.style;
in

{
  plist.appearance.theme = if cfg.dark == true then "dark" else "auto";
}
