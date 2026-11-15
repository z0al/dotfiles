{ lib, ... }:

{
  options.programs.chatgpt = with lib; {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
}
