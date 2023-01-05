{
  programs = {
    bash = {
      enable = true;
      historyIgnore = [ "exit" "clear" ];
      historyControl = [ "ignoredups" "ignorespace" "erasedups" ];
    };

    readline = {
      enable = true;
      bindings = {
        "\\C-h" = "backward-kill-word";
      };
    };
  };
}
