{ pkgs, profiles, ... }:

{
  imports = with profiles; [
    base
    gnome
  ];

  # Additional apps
  home.packages = with pkgs; [
    slack
    zoom-us
  ];

  # Install Okta browser extension
  programs.chromium.extensions = [
    { id = "glnpjglilkicbckjpbgcfkogebgllemb"; } # Okta
  ];

  # Autostart Slack in the background
  xdg.configFile."autostart/slack.desktop" = {
    text = builtins.replaceStrings
      [ "slack %U" ] [ "slack -u %U" ]
      (builtins.readFile "${pkgs.slack}/share/applications/slack.desktop");
  };
}
