{ pkgs, profiles, ... }:

{
  imports = with profiles; [
    base
  ];
}
