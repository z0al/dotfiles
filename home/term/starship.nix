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

      nix_shell = {
        format = "in [$symbol$state(\\($name\\))]($style) ";
        symbol = "❄️ ";
        impure_msg = "";
        pure_msg = "pure ";
      };
    };
  };
}
