{ pkgs, ... }:

{
  d.shell.aliases = {
    gi = "lazygit";
  };

  # https://github.com/jesseduffield/lazygit
  programs.lazygit = {
    enable = true;

    settings = {
      git.paging.colorArg = "always";
    };
  };
}
