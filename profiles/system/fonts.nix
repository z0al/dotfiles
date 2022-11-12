{ pkgs, ... }:

{
  fonts.fonts = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "Ubuntu"
        "UbuntuMono"
      ];
    })
  ];
}
