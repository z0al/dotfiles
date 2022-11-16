{ pkgs, ... }:

{
  environment = {
    shells = [ pkgs.fish ];
    variables = {
      EDITOR = "nvim";
      BROWSER = "brave";
    };
  };

  # # FIXME: MOVE TO HOME MANAGER
  # shellAliases = {
  #   ".." = "cd ..";
  #   "..." = "cd ../..";
  #   "...." = "cd ../../..";

  #   g = "git";
  #   grep = "rg";
  #   mkdir = "mkdir -p";
  #   vim = "nvim";

  #   # FIXME: linux only?
  #   open = "xdg-open &> $HOME/.xdg-open.log";
  # };

  programs = {
    bash.enableCompletion = true;

    fish.enable = true;
    fish.vendor.completions.enable = true;
  };
}
