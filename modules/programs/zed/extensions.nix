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
      nil
      nixd
    ];

    my.programs.oxfmt.enable = true;

    my.programs.zed.settings = {
      auto_install_extensions = {
        charmed-icons = true;
        nix = true;
        oxc = true;
        poimandres = true;
      };

      # Replace prettier with Oxfmt
      formatter.language_server.name = "oxfmt";

      # Nix
      languages.Nix.formatter.external = {
        command = "nixfmt";
        arguments = [ "--quiet" ];
      };
    };
  };
}
