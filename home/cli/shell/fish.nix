{ pkgs, ... }:

let
  plugins = with pkgs.fishPlugins; [
    sponge
    autopair-fish
    foreign-env
  ];
in

{
  home.packages = with pkgs; [
    any-nix-shell
  ] ++ plugins;

  programs.fish = {
    enable = true;

    shellInit = ''
      # Disable greeting message
      set -U fish_greeting

      # Bind CTRL+Backspace to delete a word
      bind \b backward-kill-word
    '';

    interactiveShellInit = ''
      any-nix-shell fish --info-right | source
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

  d.fs.persisted = {
    directories = [ ".local/share/fish" ];
  };
}
