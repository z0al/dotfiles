{ pkgs, ... }:

{
  imports = [
    ./nix.nix
    ./users.nix
  ];


  # Shells
  programs = {
    bash.enable = true;
    bash.enableCompletion = true;

    fish.enable = true;
    fish.vendor.completions.enable = true;
  };

  environment.systemPackages = with pkgs; [
    binutils
    coreutils
    curl
    fd
    fzf
    git
    gnupg
    killall
    pfetch
    polkit
    ripgrep

    ## Editors
    vim

    ## Languages
    nodejs

    python3
    python3.pkgs.pip

    rustc
    cargo
  ];

  hardware.enableRedistributableFirmware = true;
}
