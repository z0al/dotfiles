{ config, pkgs, lib, ... }:

let
  pkgsPrefix = "$HOME/.npm-packages";
in

{
  home.packages = with pkgs; [
    nodejs
    nodePackages_latest.prettier
  ];

  # Change npm prefix to enable installing packages globally
  # https://matthewrhone.dev/nixos-npm-globally
  home.sessionVariables = {
    npm_config_prefix = pkgsPrefix;
    NODE_PATH = "${pkgsPrefix}/lib/node_modules";
  };

  programs.bash.initExtra = ''
    export PATH=${pkgsPrefix}/bin:$PATH
  '';

  programs.fish.interactiveShellInit = ''
    fish_add_path ${pkgsPrefix}/bin/
  '';
}
