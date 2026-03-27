{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.claude;
in

{
  options.my.programs.claude = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      claude-code
    ];

    environment.shellAliases = {
      cl = "claude";
    };
  };
}
