{
  programs.fish = {
    enable = true;

    shellInit = ''
      # Disable greeting message
      set -U fish_greeting

      # Bind CTRL+Backspace to delete a word
      bind \b backward-kill-word
    '';
  };
}
