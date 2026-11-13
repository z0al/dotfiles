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
  options.programs.vscode.enableClaudeIntegration = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enableClaudeIntegration {
    programs.vscode.profiles.default = {
      extensions = with pkgs.vscode-marketplace; [
        anthropic.claude-code
      ];

      userSettings = {
        "claudeCode.preferredLocation" = "sidebar";
        "claudeCode.enableNewConversationShortcut" = false;
        "claudeCode.hideOnboarding" = true;
      };
    };
  };
}
