{ user, ... }:

{
  imports = [
    ./term
    ./apps/base.nix
    ./dev/base.nix
  ];

  home.persistence."/nix/data/home/${user}" = {
    allowOther = true;

    directories = [
      ".dotfiles"
    ];

    files = [ ];
  };
}
