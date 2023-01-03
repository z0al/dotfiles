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
    logseq
  ];

  # Install Okta browser extension
  programs.chromium.extensions = [
    { id = "glnpjglilkicbckjpbgcfkogebgllemb"; } # Okta
  ];
}
