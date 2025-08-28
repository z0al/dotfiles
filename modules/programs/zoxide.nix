{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.zoxide;
in

{
  options.my.programs.zoxide = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    my.programs.fzf.enable = true;
    environment.systemPackages = with pkgs; [
      zoxide
    ];

    environment.shellAliases = {
      j = "__zoxide_zi";
    };

    my.programs.bash.interactiveShellInit = ''
      eval "$(${lib.getExe pkgs.zoxide} init bash --no-cmd)"
    '';

    my.programs.fish.interactiveShellInit = ''
      ${lib.getExe pkgs.zoxide} init fish --no-cmd | source
    '';
  };
}
