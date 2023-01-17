{ pkgs, ... }:

{
  # Use 1Password for authentication
  home.shellAliases = {
    gh = "op plugin run -- gh";
  };

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
