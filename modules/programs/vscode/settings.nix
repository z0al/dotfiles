{ config, lib, ... }:

let
  cfgFonts = config.my.fonts;
in

{
  my.programs.vscode.settings = {
    # Editor
    "files.enableTrash" = true;
    "editor.cursorSmoothCaretAnimation" = "on";
    "editor.cursorStyle" = "line";
    "editor.emptySelectionClipboard" = false;
    "editor.fontFamily" = lib.concatStringsSep "," [
      "'${cfgFonts.mono}'"
      "'${cfgFonts.symbol}'"
      "'${cfgFonts.emoji}'"
    ];
    "editor.fontSize" = cfgFonts.size;
    "editor.formatOnSave" = true;
    "editor.inlineSuggest.enabled" = true;
    "editor.insertSpaces" = false;
    "editor.lineNumbers" = "on";
    "editor.minimap.enabled" = false;
    "editor.occurrencesHighlight" = "off";
    "editor.renderWhitespace" = "none";
    "editor.selectionHighlight" = false;
    "editor.useTabStops" = true;
    "editor.wordWrap" = "on";
    "editor.accessibilitySupport" = "off";
    "diffEditor.ignoreTrimWhitespace" = false;

    # https://github.com/microsoft/vscode/issues/8226
    "diffEditor.renderSideBySide" = true;
    "editor.scrollBeyondLastLine" = false;
    "editor.padding.bottom" = 100;
    "editor.guides.indentation" = false;

    # Workbench
    "workbench.iconTheme" = "vs-seti";
    "workbench.startupEditor" = "none";
    "workbench.editor.showTabs" = "single";
    "workbench.activityBar.location" = "hidden";
    "workbench.settings.editor" = "ui";
    "workbench.welcomePage.walkthroughs.openOnInstall" = false;

    # Window
    "window.menuBarVisibility" = "toggle";
    "window.zoomLevel" = 0.5;

    # Security
    "security.workspace.trust.enabled" = false;

    # Explorer
    "explorer.confirmDelete" = false;
    "explorer.confirmDragAndDrop" = false;
    "explorer.openEditors.visible" = 0;

    # Terminal
    "terminal.integrated.fontSize" = 12;
    "terminal.explorerKind" = "external";
    # "terminal.external.linuxExec" = lib.getExe pkgs.ghostty;
    # "terminal.external.osxExec" = lib.getExe pkgs.ghostty;
    "terminal.integrated.tabs.enabled" = false;

    # Git
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

    # Extensions
    "extensions.ignoreRecommendations" = true;
    "extensions.autoCheckUpdates" = false;

    # Other
    "update.mode" = "none";
    "search.showLineNumbers" = false;
    "debug.console.fontSize" = cfgFonts.size;
    "emmet.includeLanguages" = {
      "nunjucks" = "html";
    };
  };
}
