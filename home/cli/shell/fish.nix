{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.d.shell;

  plugins = with pkgs.fishPlugins; [
    sponge
    autopair-fish
    foreign-env
  ];

  source = path:
    if hasSuffix ".fish" path
    then ''source "${path}"''
    else ''fenv source "${path}"'';
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

    shellAliases = {
      unset = "set -e";
    };

    interactiveShellInit = ''
      any-nix-shell fish --info-right | source

      # d.shell.sources
      ${concatStringsSep "\n" (map (path: ''
        if test -e "${path}"
          ${source path}
        end
      '') cfg.sources)}
    '';
  };

  d.fs.persisted = {
    directories = [ ".local/share/fish" ];
  };
}
