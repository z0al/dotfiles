{ config, pkgs, lib, ... }:

let
  cfg = config.d.profiles.dev;
in

{
  d.programs.vscode = lib.mkIf cfg.enable {
    extensions = with pkgs.vscode-marketplace; [
      eamodio.gitlens
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

      "gitlens.statusBar.enabled" = false;
      "gitlens.statusBar.pullRequests.enabled" = false;
      "gitlens.graph.statusBar.enabled" = false;
      "gitlens.mode.statusBar.enabled" = false;
      "gitlens.keymap" = "none";
      "gitlens.showWelcomeOnInstall" = false;
      "gitlens.launchpad.indicator.enabled" = false;
      "gitlens.currentLine.scrollable" = false;
      "gitlens.hovers.currentLine.over" = "line";
    };
  };
}
