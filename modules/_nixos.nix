{
  # imports all **/*/_nixos.nix
  imports = [
    ./.
    ./etc/fonts/_nixos.nix
    ./etc/users/_nixos.nix
    ./programs/1password/_nixos.nix
    ./programs/aws/_nixos.nix
    ./programs/direnv/_nixos.nix
    ./programs/docker/_nixos.nix
    ./programs/kubectl/_nixos.nix
    ./programs/vscode/_nixos.nix
  ];
}
