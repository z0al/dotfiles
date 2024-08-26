{
  # imports all **/*/_nixos.nix
  imports = [
    ./.
    ./fonts/_nixos.nix
    ./programs/1password/_nixos.nix
    ./programs/aws/_nixos.nix
    ./programs/chrome/_nixos.nix
    ./programs/direnv/_nixos.nix
    ./programs/docker/_nixos.nix
    ./programs/fnm/_nixos.nix
    ./programs/kubectl/_nixos.nix
    ./programs/vscode/_nixos.nix
    ./programs/zoxide/_nixos.nix
    ./system/shell/_nixos.nix
    ./user/_nixos.nix
  ];
}
