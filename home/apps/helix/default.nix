{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.d.apps.helix;
in

{
  imports = [
    ./config.nix
  ];

  options.d.apps.helix = {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = mkIf cfg.enable {
    programs.helix = {
      enable = true;
    };

    # hx --health
    # Languages servers & tools
    home.packages =
      (with pkgs.nodePackages; [
        bash-language-server
        typescript-language-server
        yaml-language-server
        vscode-langservers-extracted
      ]) ++

      (with pkgs; [
        delve
        gopls
        lldb
        lua-language-server
        marksman
        nil
        python311Packages.python-lsp-server
        taplo
        terraform-ls
      ]);
  };
}
