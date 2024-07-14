{ config, lib, ... }:

with lib;

let
  cfg = config.d.fonts;
in

{
  config = mkIf cfg.enable {
    fonts = {
      enableDefaultPackages = true;
      fontDir.enable = true;

      # Grayscale anti-aliasing for fonts
      fontconfig.antialias = true;
    };
  };
}
