{
  # imports all **/*/_darwin.nix
  imports = [
    ./.
    ./etc/nix/_darwin.nix
    ./etc/sudoers/_darwin.nix
    ./etc/users/_darwin.nix
    ./programs/docker/_darwin.nix
    ./programs/homebrew/_darwin.nix
  ];
}
