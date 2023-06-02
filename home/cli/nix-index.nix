{
  programs.nix-index = {
    enable = true;

    enableBashIntegration = true;
    enableFishIntegration = true;
  };

  programs.nix-index-database.comma.enable = true;
}
