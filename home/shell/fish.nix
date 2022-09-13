{ config, pkgs, inputs, ... }:

{
  programs.fish = {
    enable = true;

    shellInit = ''
      # Disable greeting message
      set -U fish_greeting

      # Bind CTRL+Backspace to delete a word
      bind \b backward-kill-word
    '';

    # Move these to their own modules e.g. ./fzf.nix & z.nix
    plugins = [
      {
        name = "fzf";
        src = inputs.fishFzf;
      }

      {
        name = "z";
        src = inputs.fishZ;
      }
    ];
  };
}
