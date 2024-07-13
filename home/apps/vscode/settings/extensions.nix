{ pkgs, ... }:

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
    "gitlens.launchpad.indicator.enabled" = false;

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

    # Rust Analyzer
    "rust-analyzer.inlayHints.chainingHints.enable" = false;

    # Nix IDE
    "nix.formatterPath" = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt";

    # Shell Format
    "shellformat.useEditorConfig" = true;
    "shellformat.path" = "${pkgs.shfmt}/bin/shfmt";

    # Docker
    "[dockerfile]" = {
      "editor.defaultFormatter" = "ms-azuretools.vscode-docker";
    };

    # Python
    "[python]" = {
      "editor.defaultFormatter" = "ms-python.black-formatter";
    };

    "black-formatter.args" = [ "--line-length" "80" ];

    # GitHub Copilot
    "github.copilot.editor.enableCodeActions" = false;
  };
}
