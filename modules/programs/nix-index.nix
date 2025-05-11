{ config, pkgs, lib, ... }:

let
  cfg = config.my.programs.nix-index;
  package = config.programs.nix-index.package;
in

{
  options.my.programs.nix-index = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.nix-index.enable = true;
    programs.nix-index-database.comma.enable = true;

    my.programs.bash.interactiveShellInit = ''
      source ${package}/etc/profile.d/command-not-found.sh
    '';

    # See https://github.com/nix-community/nix-index/issues/126
    my.programs.fish.interactiveShellInit =
      let
        wrapper = pkgs.writeScript "command-not-found" ''
          #!${pkgs.bash}/bin/bash
          source ${package}/etc/profile.d/command-not-found.sh
          command_not_found_handle "$@"
        '';
      in
      ''
        function fish_command_not_found
          ${wrapper} $argv
        end
      '';
  };
}



