{ pkgs, ... }:

{
  programs.vscode.userSettings = {
    "extensions.experimental.affinity" = {
      "asvetliakov.vscode-neovim" = 1;
    };

    "vscode-neovim.neovimInitVimPaths.linux" = "$HOME/.config/nvim/vscode.lua";
    "vscode-neovim.neovimExecutablePaths.linux" = "/run/current-system/sw/bin/nvim";
  };

  xdg.configFile."nvim/vscode.lua".source = ./vscode.lua;
}
