{
  home.sessionVariables = {
    TERMINAL = "kitty";
  };

  programs.kitty = {
    enable = true;

    font = {
      name = "FiraCode Nerd Font";
      size = 11;
    };

    keybindings = import ./keybindings.nix;

    settings = { };
  };
}
