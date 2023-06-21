{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    terminus_font
  ];

  console.font = "${pkgs.terminus_font}/share/consolefonts/ter-v16n.psf.gz";

  # Needed when typing in passwords for full disk encryption
  console.earlySetup = true;
  boot.loader.systemd-boot.consoleMode = "1";


  # Grayscale anti-aliasing for fonts
  fonts.fontconfig.antialias = true;
  fonts.fontconfig.subpixel = {
    rgba = "none";
    lcdfilter = "none";
  };

  d.hm = [{
    programs.autorandr.enable = true;
  }];
}
