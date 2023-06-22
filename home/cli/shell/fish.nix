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
  };

  d.fs.persisted = {
    directories = [ ".local/share/fish" ];
  };
}
