{ config, pkgs, lib, ... }:

let
  cfg = config.d.presets.nix;

  server = pkgs.unstable.nixd;
in

{
  d.programs.vscode = lib.mkIf cfg.enable {
    packages = [ server ];

    extensions = with pkgs.vscode-marketplace; [
      jnoortheen.nix-ide
    ];

    settings = {
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = lib.getExe server;
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
