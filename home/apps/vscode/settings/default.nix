{ theme, ... }:

let
  themeMapping = {
    catppuccin = "Catppuccin Mocha";
  };
in

{
  imports = [
    ./extensions.nix
  ];

  programs.vscode.userSettings = {
    # Editor
    "files.enableTrash" = true;
    "files.autoSave" = "off";
    "editor.cursorSmoothCaretAnimation" = "on";
    "editor.cursorStyle" = "line";
    "editor.emptySelectionClipboard" = false;
    "editor.fontFamily" = "'JetBrains Mono','Symbols Nerd Font Mono','PowerlineSymbols','Noto Color Emoji'";
    "editor.fontSize" = 13;
    "editor.formatOnSave" = true;
    "editor.inlineSuggest.enabled" = true;
    "editor.insertSpaces" = false;
    "editor.lineNumbers" = "on";
    "editor.minimap.enabled" = false;
    "editor.occurrencesHighlight" = false;
    "editor.renderWhitespace" = "none";
    "editor.selectionHighlight" = false;
    "editor.useTabStops" = true;
    "editor.wordWrap" = "on";
    "diffEditor.ignoreTrimWhitespace" = false;
    "diffEditor.renderSideBySide" = false;


    # Workbench
    "workbench.colorTheme" = themeMapping.${theme};
    "workbench.iconTheme" = "vs-seti";
    "workbench.startupEditor" = "none";
    "workbench.editor.showTabs" = false;
    "workbench.activityBar.visible" = false;
    "workbench.settings.editor" = "json";
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
    "terminal.integrated.fontSize" = 13;
    "terminal.explorerKind" = "external";
    "terminal.external.linuxExec" = "wezterm";
    "terminal.external.osxExec" = "Terminal.app";
    "terminal.integrated.tabs.enabled" = false;

    # Git
    "git.autofetch" = false;
    "git.autoStash" = true;
    "git.pullTags" = true;
    "git.enableCommitSigning" = true;
    "git.alwaysSignOff" = false;
    "git.suggestSmartCommit" = false;
    "git.confirmSync" = false;

    # Other
    "search.showLineNumbers" = false;
    "debug.console.fontSize" = 13;
    "emmet.includeLanguages" = {
      "nunjucks" = "html";
    };

    # TypeScript
    "typescript.updateImportsOnFileMove.enabled" = "always";
  };
}
