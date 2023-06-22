{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    terminus_font
  ];

  console.font = "${pkgs.terminus_font}/share/consolefonts/ter-v32n.psf.gz";

  # Needed when typing in passwords for full disk encryption
  console.earlySetup = true;
  boot.loader.systemd-boot.consoleMode = "max";

  # Grayscale anti-aliasing for fonts
  fonts.fontconfig.antialias = true;
}
