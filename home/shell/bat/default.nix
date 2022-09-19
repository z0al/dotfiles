{ theme, ... }:

{
  home.shellAliases = {
    "cat" = "bat";
  };

  programs.bat = {
    enable = true;
    config = {
      inherit theme;
    };
  };

  home.file.".config/bat/themes" = {
    recursive = true;
    source = ./themes;
    onChange = "bat cache --build";
  };
}
