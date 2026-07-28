{ lib, ... }:

{
  config = {
    programs.bat = {
      enable = lib.mkDefault true;

      config = {
        style = "plain";
        theme = "base16";
      };
    };
  };
}
