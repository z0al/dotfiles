{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.vscode;
in

{
  options.programs.vscode.enablePythonIntegration = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enablePythonIntegration {
    programs.vscode.profiles.default = {
      extensions = with pkgs.vscode-marketplace; [
        ms-python.python
      ];
    };
  };
}
