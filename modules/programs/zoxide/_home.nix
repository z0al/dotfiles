{ lib, ... }:

{
  config.programs.fzf.enable = true;

  config.programs.zoxide = {
    enable = lib.mkDefault true;
    options = [ "--no-cmd" ];
  };
}
