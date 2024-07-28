{ pkgs, ... }:

{
  environment = {
    shells = [ pkgs.fish ];
  };

  programs = {
    bash.enableCompletion = true;

    fish.enable = true;
    fish.useBabelfish = true;
    fish.vendor.completions.enable = true;
  };
}
