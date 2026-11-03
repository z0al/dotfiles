{ lib, ... }:

{
  config = {
    programs.gh = {
      enable = lib.mkDefault true;
      settings.git_protocol = "ssh";
    };
  };
}
