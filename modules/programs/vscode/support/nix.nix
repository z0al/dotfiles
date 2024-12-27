{ config, pkgs, lib, ... }:

let
  cfg = config.d.presets.nix;
in

{
  d.programs.vscode = lib.mkIf cfg.enable {
    packages = with pkgs; [
      nixd
    ];

    extensions = with pkgs.vscode-marketplace; [
      jnoortheen.nix-ide
    ];

    settings = {
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = lib.getExe pkgs.nixd;
      "nix.serverSettings" = {
        nixd.formatting.command = [ (lib.getExe pkgs.nixpkgs-fmt) ];
      };

      "nix.hiddenLanguageServerErrors" = [
        "textDocument/completion"
        "textDocument/definition"
        "textDocument/documentSymbol"
      ];
    };
  };
}
