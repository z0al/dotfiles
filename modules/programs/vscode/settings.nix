{ config, pkgs, lib, ... }:

let
  fonts = config.d.style.fonts;
in

{
  d.programs.vscode.settings = {
    # Editor
    "files.enableTrash" = true;
    "files.autoSave" = "onFocusChange";
    "editor.cursorSmoothCaretAnimation" = "on";
    "editor.cursorStyle" = "line";
    "editor.emptySelectionClipboard" = false;
    "editor.fontFamily" = lib.concatStringsSep "," [
      "'${fonts.mono}'"
      "'${fonts.symbol}'"
      "'${fonts.emoji}'"
    ];
    "editor.fontSize" = 13;
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
    "diffEditor.renderSideBySide" = false;
    "editor.scrollBeyondLastLine" = false;
    "editor.padding.bottom" = 100;
    "editor.rulers" = [ 80 ];
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
    "terminal.external.linuxExec" = "${pkgs.wezterm}/bin/wezterm";
    "terminal.external.osxExec" = "Terminal.app";
    "terminal.integrated.tabs.enabled" = false;

    # Extensions
    "extensions.ignoreRecommendations" = true;
    "extensions.autoCheckUpdates" = false;

    # Other
    "update.mode" = "none";
    "search.showLineNumbers" = false;
    "debug.console.fontSize" = 13;
    "emmet.includeLanguages" = {
      "nunjucks" = "html";
    };
  };
}
