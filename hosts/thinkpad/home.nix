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

  # Startup applications
  services.autostart.applications = {
    slack = {
      package = pkgs.slack;
      exec = "slack -u";
    };
  };
}
