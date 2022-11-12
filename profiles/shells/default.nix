{ pkgs, ... }:

{
  imports = [
    ./aliases.nix
  ];

  # Environment
  environment = {
    shells = [ pkgs.fish ];
    variables = {
      EDITOR = "nvim";
      BROWSER = "brave";
    };
  };

  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
    };

    fish = {
      enable = true;
      vendor.completions.enable = true;
    };
  };
}
