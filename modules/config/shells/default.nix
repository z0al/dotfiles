{
  imports = [
    ./aliases.nix
    ./localrc.nix
  ];

  # Disables "last login" message in terminals
  hm.home.file.".hushlogin".text = "";

  # Quit pager on ESC ESC
  hm.home.file.".lesskey".text = ''
    \e quit
  '';
}

