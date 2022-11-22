{ pkgs, ... }:

let
  vscode-neovim = pkgs.vscode-extensions.asvetliakov.vscode-neovim.overrideAttrs (o: {
    postPatch = (o.postPatch or "") + ''
      substituteInPlace ./dist/extension.js \
        --replace 'this.modeItem.hide()' '(this.modeItem.text="-- NORMAL --",this.modeItem.show())'
    '';
  });
in
{
  imports = [
    ./settings
  ];

  programs.vscode = {
    enable = true;

    # FIXME: Temporarily disabled until we stop patching vscode-neovim
    mutableExtensionsDir = false;
    # enableUpdateCheck = false;
    # enableExtensionUpdateCheck = true;

    extensions = with pkgs.vscode-extensions; [
      # asvetliakov.vscode-neovim
      vscode-neovim
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
    ];
  };
}
