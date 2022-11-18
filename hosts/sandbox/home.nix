{ profiles, ... }:

{
  imports = with profiles; [
    base
    gnome
  ];

  programs.git.extraConfig = {
    safe.directory = "*";
  };
}
