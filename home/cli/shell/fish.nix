{ pkgs, ... }:

{
  home.packages = with pkgs.fishPlugins; [
    sponge
    autopair-fish
    foreign-env
  ];

  programs.fish = {
    enable = true;

    shellInit = ''
      # Disable greeting message
      set -U fish_greeting

      # Bind CTRL+Backspace to delete a word
      bind \b backward-kill-word

      ${if pkgs.stdenv.isDarwin then ''
      # Cmd + Left or Right
      bind \e\[C forward-word
      bind \e\[D backward-word
      '' else ""}
    '';

    plugins = [
      {
        name = "history-merge";
        src = pkgs.fetchFromGitHub {
          owner = "2m";
          repo = "fish-history-merge";
          rev = "7e415b8ab843a64313708273cf659efbf471ad39";
          sha256 = "oy32I92sYgEbeVX41Oic8653eJY5bCE/b7EjZuETjMI=";
        };
      }
    ];
  };
}
