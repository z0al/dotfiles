{ pkgs, ... }:

{
  imports = [
    ./settings
  ];

  programs.vscode = {
    enable = true;

    mutableExtensionsDir = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = true;

    extensions = with pkgs.vscode-extensions; [
      # Git
      github.copilot
      eamodio.gitlens

      # Languages
      bradlc.vscode-tailwindcss
      bungcip.better-toml
      dotjoshjohnson.xml
      jnoortheen.nix-ide

      # Themes
      dracula-theme.theme-dracula
      catppuccin.catppuccin-vsc

      # Vim
      asvetliakov.vscode-neovim
      vspacecode.whichkey
      # skattyadz.vscode-quick-scope

      # Formatting and linting
      dbaeumer.vscode-eslint
      editorconfig.editorconfig
      esbenp.prettier-vscode
      streetsidesoftware.code-spell-checker
      # JohnnyMorganz.stylua
    ];
  };
}
