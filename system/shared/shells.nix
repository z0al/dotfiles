{ pkgs, ... }:

{
  environment = {
    shells = [ pkgs.fish ];

    variables = {
      EDITOR = "nvim";
      BROWSER = "brave";
    };

    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";

      g = "git";
      grep = "rg";
      mkdir = "mkdir -p";
    };
  };

  programs = {
    bash.enableCompletion = true;

    fish.enable = true;
    fish.vendor.completions.enable = true;
  };
}
