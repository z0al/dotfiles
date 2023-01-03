{ config, pkgs, lib, ... }:

let
  #   pkgsPrefix = "$HOME/.npm-packages";
  globalPkgs = with pkgs.nodePackages_latest; [
    yarn
    prettier
  ];
in

{
  home.packages = globalPkgs ++ [
    pkgs.nodejs
  ];

  # Change npm prefix to enable installing packages globally
  # https://matthewrhone.dev/nixos-npm-globally
  # home.activation = {
  #   setNpmPkgsPrefix = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
  #     $DRY_RUN_CMD ${pkgs.nodejs}/bin/npm config set prefix ${pkgsPrefix}
  #   '';
  # };

  # programs.bash.initExtra = ''
  #   export PATH=${pkgsPrefix}/bin:$PATH
  #   export NODE_PATH=${pkgsPrefix}/lib/node_modules
  # '';

  # programs.fish.interactiveShellInit = ''
  #   fish_add_path    ${pkgsPrefix}/bin/
  #   set -x NODE_PATH ${pkgsPrefix}/lib/node_modules
  # '';
}
