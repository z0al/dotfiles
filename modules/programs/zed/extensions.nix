{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.zed;
in

{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      nixd
      nil
    ];

    my.programs.zed.settings = {
      auto_install_extensions = {
        nix = true;
        poimandres = true;
        charmed-icons = true;
      };

      # Nix
      languages.Nix.formatter.external = {
        command = "nixfmt";
        arguments = [ "--quiet" ];
      };
    };
  };
}
