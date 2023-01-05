{ pkgs, ... }:

{
  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "ssh";

      aliases = {
        clone = "repo clone";
        co = "pr checkout";
        pv = "pr view";
      };
    };
  };
}
