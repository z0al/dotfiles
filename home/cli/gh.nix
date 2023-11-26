{ pkgs, ... }:

{
  programs.gh = {
    enable = true;

    settings = {
      # Works well with SSH auth via 1Password
      git_protocol = "ssh";

      aliases = {
        clone = "repo clone";
        co = "pr checkout";
        pv = "pr view";
      };
    };
  };
}
