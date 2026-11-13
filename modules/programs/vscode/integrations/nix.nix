{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.vscode;
in

{
  options.programs.vscode.enableNixIntegration = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enableNixIntegration {
    programs.vscode.profiles.default = {
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
