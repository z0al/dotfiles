{ config, lib, ... }:

let
  cfg = config.profiles.desktop;
in

{
  options.profiles.desktop.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enable {
    programs = {
      chrome.enable = lib.mkDefault true;
      ghostty.enable = lib.mkDefault true;
      safari.enable = lib.mkDefault true;
    };
  };
}
