{ lib, ... }:

{
  config = {
    programs.fd.enable = lib.mkDefault true;
  };
}
