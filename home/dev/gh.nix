{ pkgs, ... }:

{
  # Use 1Password for authentication
  home.shellAliases = {
    gh = "op plugin run -- gh";
  };

  programs.gh = {
    enable = true;

    settings = {
      aliases = {
        clone = "repo clone";
        co = "pr checkout";
        pv = "pr view";
      };
    };
  };
}
