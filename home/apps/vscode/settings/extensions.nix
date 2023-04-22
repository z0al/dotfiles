let
  prettier = {
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
  };
in
{
  programs.vscode.userSettings = {
    ## GitLens
    "gitlens.statusBar.enabled" = false;
    "gitlens.statusBar.pullRequests.enabled" = false;
    "gitlens.graph.statusBar.enabled" = false;
    "gitlens.mode.statusBar.enabled" = false;
    "gitlens.keymap" = "none";
    "gitlens.showWelcomeOnInstall" = false;

    ## Prettier
    "prettier.enable" = true;
    "prettier.semi" = true;
    "prettier.useTabs" = true;

    "[css]" = prettier;
    "[scss]" = prettier;
    "[html]" = prettier;
    "[json]" = prettier;
    "[jsonc]" = prettier;
    "[markdown]" = prettier;
    "[javascript]" = prettier;
    "[typescript]" = prettier;
    "[javascriptreact]" = prettier;
    "[typescriptreact]" = prettier;

    ## SpellCheck
    "cSpell.showStatus" = false;
    "cSpell.words" = [
      "Catppuccin"
      "Neovim"
      "NixOS"
    ];

    ## Stylua
    "[lua]" = {
      "editor.defaultFormatter" = "JohnnyMorganz.stylua";
    };
  };
}
