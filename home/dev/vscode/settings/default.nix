{ theme, ... }:

let
  vsTheme = builtins.replaceStrings [ "-" ] [ " " ] theme;
in

{
  imports = [
    ./extensions/git-lens.nix
    ./extensions/prettier.nix
    ./extensions/spell-check.nix
    ./extensions/stylua.nix
  ];

  programs.vscode.userSettings = {
    # Editor
    "files.autoSave" = "off";
    "editor.insertSpaces" = false;
    "editor.lineNumbers" = "on";
    "editor.useTabStops" = true;
    "editor.wordWrap" = "on";
    "editor.cursorSmoothCaretAnimation" = "on";
    "editor.cursorStyle" = "line";
    "editor.fontFamily" = "'JetBrains Mono','Symbols Nerd Font Mono','PowerlineSymbols','Noto Color Emoji'";
    "editor.fontSize" = 13;
    "editor.formatOnSave" = true;
    "editor.occurrencesHighlight" = false;
    "editor.selectionHighlight" = false;
    "editor.minimap.enabled" = false;
    "editor.inlineSuggest.enabled" = true;
    "editor.renderWhitespace" = "none";
    "diffEditor.ignoreTrimWhitespace" = false;
    "editor.emptySelectionClipboard" = false;
    "files.enableTrash" = true;

    # Workbench
    "workbench.colorTheme" = vsTheme;
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
    "git.autofetch" = true;
    "git.autoStash" = true;
    "git.pullTags" = true;
    "git.enableCommitSigning" = true;
    "git.alwaysSignOff" = false;
    "git.suggestSmartCommit" = false;
    "git.confirmSync" = false;

    # Other
    "search.showLineNumbers" = false;
    "debug.console.fontSize" = 13;

    # TypeScript
    "typescript.updateImportsOnFileMove.enabled" = "always";
  };
}
