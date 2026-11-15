{ config, lib, ... }:

let
  cfg = config.my.programs.chatgpt;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "chatgpt"
    ];
  };
}
