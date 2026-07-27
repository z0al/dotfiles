{ lib, ... }:

{
  config = {
    programs.fzf.enable = true;

    programs.zoxide = {
      enable = lib.mkDefault true;
      options = [ "--no-cmd" ];
    };
  };
}
