{ inputs, ... }:

{
  imports = [
    inputs.treefmt-nix.flakeModule
  ];

  perSystem = {
    treefmt = {
      projectRootFile = ".git/config";

      programs.nixfmt.enable = true;
      settings.formatter.nixfmt.options = [
        "--width=72"
      ];
    };
  };
}
