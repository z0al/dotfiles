{
  imports = [
    ./aliases.nix
    ./localrc.nix
  ];

  # Disables "last login" message in terminals
  hm.home.file.".hushlogin".text = "";
}

