{ config, pkgs, lib, ... }:

let
  cfg = config.my.programs.vscode;
in

{
  my.programs.vscode = lib.mkIf cfg.enable {
    extensions = with pkgs.vscode-marketplace; [
      mk12.better-git-line-blame
    ];

    settings = {
      "git.autofetch" = false;
      "git.autoStash" = true;
      "git.pullTags" = true;
      "git.enableCommitSigning" = true;
      "git.alwaysSignOff" = false;
      "git.suggestSmartCommit" = false;
      "git.confirmSync" = false;
      "git.openRepositoryInParentFolders" = "always";
      "scm.showIncomingChanges" = "never";
      "scm.showOutgoingChanges" = "never";
      "scm.showHistoryGraph" = false;

      "betterGitLineBlame.annotateWholeLine" = false;
      "betterGitLineBlame.enableHoverMessages" = true;
      "betterGitLineBlame.ignoreWhitespaceChanges" = true;
      "betterGitLineBlame.showStatusBarItem" = false;
    };
  };
}
