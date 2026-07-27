{
  imports = [
    ./aliases.nix
    ./localrc.nix
  ];

  # Backs users.users.<user>.shell / /etc/shells (config/users/default.nix)
  programs.fish = {
    enable = true;
    useBabelfish = true;

    vendor.config.enable = true;
    vendor.functions.enable = true;
    vendor.completions.enable = true;
  };

  programs.bash.completion.enable = true;

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
