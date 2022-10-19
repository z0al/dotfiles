{ pkgs-unstable, ... }:

{
  programs.starship = {
    enable = true;
    package = pkgs-unstable.starship;

    enableBashIntegration = true;
    enableFishIntegration = true;

    settings = {
      battery = {
        disabled = true;
      };

      cmd_duration = {
        format = "[$duration]($style)";
      };
    };
  };
}
