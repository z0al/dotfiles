{ pkgs, profiles, ... }:

{
  imports = with profiles; [
    base
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
  services.startup.applications = [
    {
      package = pkgs.slack;
      command = "slack -u";
    }
  ];
}
