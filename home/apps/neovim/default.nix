{ pkgs, ... }:

{
  # Requirements
  # https://www.lazyvim.org/#%EF%B8%8F-requirements
  home.packages = with pkgs; [
    lazygit
    ripgrep
    fd
  ];

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  # Based on https://github.com/LazyVim/starter
  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
