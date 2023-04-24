{ pkgs, ... }:

{
  home.shellAliases = {
    lg = "lazygit";
  };

  # https://github.com/jesseduffield/lazygit
  programs.lazygit = {
    enable = true;

    settings = {
      git.paging = {
        colorArg = "always";
        pager = "${pkgs.delta}/bin/delta --dark --paging=never";
      };
    };
  };
}
