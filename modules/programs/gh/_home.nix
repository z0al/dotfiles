{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg1Password = config.programs._1password;

  # https://developer.1password.com/docs/cli/shell-plugins/github/
  #
  # Exposes `gh` as a wrapper that runs through the 1Password shell plugin, so
  # it applies to every caller (scripts, agents), not just interactive shells.
  # `op plugin run` matches the command by name, so it can't take a store path;
  # the real gh is put first on PATH instead to avoid recursing into the wrapper.
  ghWrapped = pkgs.symlinkJoin {
    name = "gh-wrapped";
    paths = [
      (pkgs.writeShellScriptBin "gh" ''
        export PATH="${pkgs.gh}/bin:$PATH"
        exec op plugin run -- gh "$@"
      '')
      pkgs.gh
    ];
    meta.mainProgram = "gh";
  };
in

{
  config = {
    programs.gh = {
      enable = lib.mkDefault true;
      settings.git_protocol = "ssh";
      package = lib.mkIf cfg1Password.enable ghWrapped;
    };
  };
}
