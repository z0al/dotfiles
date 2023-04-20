{
  imports = [
    ./apps
    ./cli
    ./dev
    ./startup.nix
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
