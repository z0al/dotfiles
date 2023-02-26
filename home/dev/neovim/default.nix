{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
