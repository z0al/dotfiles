{ ... }:

{
  programs.starship = {
    enable = true;

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
