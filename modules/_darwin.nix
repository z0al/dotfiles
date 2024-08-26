{
  # imports all **/*/_darwin.nix
  imports = [
    ./.
    ./programs/1password/_darwin.nix
    ./programs/chrome/_darwin.nix
    ./programs/docker/_darwin.nix
    ./security/_darwin.nix
    ./system/homebrew/_darwin.nix
    ./system/nix/_darwin.nix
    ./user/_darwin.nix
  ];
}
