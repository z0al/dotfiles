{ lib, ... }:

{
  config = {
    programs.neovim = {
      enable = lib.mkDefault true;
      vimAlias = true;
      defaultEditor = true;
    };
  };
}
