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
      asvetliakov.vscode-neovim
      bradlc.vscode-tailwindcss
      bungcip.better-toml
      catppuccin.catppuccin-vsc
      dbaeumer.vscode-eslint
      dotjoshjohnson.xml
      dracula-theme.theme-dracula
      eamodio.gitlens
      editorconfig.editorconfig
      esbenp.prettier-vscode
      github.copilot
      jnoortheen.nix-ide
      streetsidesoftware.code-spell-checker
      vspacecode.whichkey
      # skattyadz.vscode-quick-scope
    ];
  };
}
