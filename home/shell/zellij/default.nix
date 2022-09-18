{ config, pkgs, inputs, ... }:

{
  programs.zellij = {
    enable = true;

    settings = {
      # theme = "catppuccin";
      copy_on_select = false;
      pane_frames = false;
    };
  };

  # Don't auto load but add a key to open zellij e.g. CTRL + Z
  # programs.bash.initExtra = ''
  #   eval "$(zellij setup --generate-auto-start bash)"
  # '';

  # programs.fish.interactiveShellInit = ''
  #   eval (zellij setup --generate-auto-start fish | string collect)
  # '';
}
