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
  options.programs.vscode.enableRustIntegration = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enableRustIntegration {
    programs.vscode.profiles.default = {
      extensions = with pkgs.vscode-marketplace; [
        rust-lang.rust-analyzer
      ];

      userSettings = {
        "rust-analyzer.inlayHints.chainingHints.enable" = false;
      };
    };
  };
}
