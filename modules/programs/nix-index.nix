{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.nix-index;
  package = config.programs.nix-index.package;
in

{
  options.d.programs.nix-index = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.nix-index.enable = true;
    programs.nix-index-database.comma.enable = true;

    # See https://github.com/nix-community/nix-index/issues/126
    d.programs.fish.init =
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



