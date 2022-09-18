{ ... }:

{
  programs = {
    bash = {
      enable = true;
    };

    readline = {
      enable = true;
      bindings = {
        "\\C-h" = "backward-kill-word";
      };
    };
  };
}
