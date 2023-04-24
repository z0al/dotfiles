{ theme, ... }:

{
  # https://dandavison.github.io/delta
  programs.git.delta = {
    enable = true;

    options = {
      line-numbers = true;
      # Note: compatible with Bat themes
      syntax-theme = theme;
      hunk-header-style = "omit";
    };
  };
}
