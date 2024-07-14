{
  # imports all **/*/_nixos.nix
  imports = [
    ./.
    ./etc/fonts/_nixos.nix
    ./etc/users/_nixos.nix
  ];
}
