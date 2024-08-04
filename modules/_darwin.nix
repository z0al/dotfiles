{
  # imports all **/*/_darwin.nix
  imports = [
    ./.
    ./programs/1password/_darwin.nix
    ./programs/docker/_darwin.nix
    ./system/homebrew/_darwin.nix
    ./system/nix/_darwin.nix
    ./system/sudoers/_darwin.nix
    ./system/users/_darwin.nix
  ];
}
