{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.cursor;
in

{
  options.programs.cursor.enableNixIntegration = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enableNixIntegration {
    programs.cursor.profiles.default = {
      extensions = with pkgs.vscode-marketplace; [
        jnoortheen.nix-ide
      ];

      userSettings = {
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = lib.getExe pkgs.nixd;
        "nix.serverSettings" = {
          nixd.formatting.command = [ "nixfmt" ];
        };
        "nix.hiddenLanguageServerErrors" = [
          "textDocument/completion"
          "textDocument/definition"
          "textDocument/documentSymbol"
        ];
      };
    };
  };
}
