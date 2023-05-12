{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      fd
      lazygit
      ripgrep
      xclip
    ];
  };

  # Based on https://github.com/LazyVim/starter
  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };

  d.fs.persisted = {
    directories = [ ".local/share/nvim" ];
  };
}
