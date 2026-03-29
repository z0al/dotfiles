{
  imports = [
    ./aliases.nix
    ./localrc.nix
  ];

  environment.extraInit = ''
    export PATH="$HOME/.local/bin:$PATH"
  '';

  # Disables "last login" message in terminals
  home.file.".hushlogin".text = "";

  # Quit pager on ESC ESC
  home.file.".lesskey".text = ''
    \e quit
  '';
}
