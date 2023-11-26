{ pkgs, ... }:

let
  wallpaper = "${../../assets/wallpaper.jpg}";
  avatar = "${../../assets/avatar.png}";
in

{
  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = wallpaper;
      picture-uri-dark = wallpaper;
    };

    "org/gnome/desktop/screensaver" = {
      picture-uri = wallpaper;
    };
  };

  home.file.".face".source = avatar;
}
