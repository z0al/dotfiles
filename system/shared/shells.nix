{ pkgs, lib, ... }:

let
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
in

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

      grep = "rg";
      mkdir = "mkdir -p";
      open =
        if isDarwin
        then "open"
        else "xdg-open &> $HOME/.xdg-open.log";

      xargs = if isDarwin then "xargs" else "xargs -r";
    };
  };

  programs = {
    bash.enableCompletion = true;

    fish.enable = true;
    fish.vendor.completions.enable = true;
  };
}
