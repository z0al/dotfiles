{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nil
    nixpkgs-fmt
  ];

  programs.helix.languages = {
    language-server.nil = {
      command = "${pkgs.nil}/bin/nil";

      config.nil = {
        formatting.command = [ "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt" ];

        nix = {
          binary = "${pkgs.nix}/bin/nix";
          flake = {
            autoEvalInputs = true;
          };
        };
      };
    };
  };
}
