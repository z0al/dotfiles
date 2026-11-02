{ config, lib, ... }:

{
  options.programs.claude = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.programs.claude-code.enable;
    };
  };
}
