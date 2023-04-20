{
  imports = [
    ./term
    ./apps/base.nix
    ./dev/base.nix
  ];

  d.fs.persisted = {
    directories = [
      "Desktop"
      "Downloads"
      "Music"
      "Pictures"
      "Documents"
      "Videos"
      ".dotfiles"
      ".ssh"
    ];
  };
}
