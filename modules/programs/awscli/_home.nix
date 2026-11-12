{ lib, ... }:

{
  config = {
    programs.awscli.enable = lib.mkDefault false;
  };
}
