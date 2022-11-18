{ profiles, ... }:

{
  imports = with profiles; [
    base
  ];

  programs.git.extraConfig = {
    safe.directory = "*";
  };
}
