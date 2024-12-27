{
  imports = [
    ./aliases.nix
    ./localrc.nix
  ];

  # Disables "last login" message in terminals
  my.hm.config.home.file.".hushlogin".text = "";
}

