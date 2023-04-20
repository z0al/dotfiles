{ config, profiles, ... }:

{
  imports = with profiles; [
    base
  ];
}
