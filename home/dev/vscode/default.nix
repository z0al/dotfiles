{ pkgs, ... }:

{
  imports = [
    ./settings
    ./keybindings.nix
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

      # Formatting and linting
      dbaeumer.vscode-eslint
      editorconfig.editorconfig
      esbenp.prettier-vscode
      streetsidesoftware.code-spell-checker
      # JohnnyMorganz.stylua
    ];
  };
}
