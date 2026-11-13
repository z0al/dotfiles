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
  options.programs.cursor.enableClaudeIntegration = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enableClaudeIntegration {
    programs.cursor.profiles.default = {
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
