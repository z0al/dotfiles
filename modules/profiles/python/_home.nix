{ config, lib, ... }:

let
  cfg = config.profiles.python;
in

{
  options.profiles.python.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enable {
    programs = {
      uv.enable = lib.mkDefault true;

      vscode.enablePythonIntegration = lib.mkDefault true;
      cursor.enablePythonIntegration = lib.mkDefault true;
    };
  };
}
