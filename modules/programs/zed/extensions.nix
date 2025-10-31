{
  my.programs.zed.settings = {
    auto_install_extensions = {
      nix = true;
      poimandres = true;
    };

    # Nix
    languages.Nix.formatter.external = {
      command = "nixfmt";
      arguments = [ "--quiet" ];
    };
  };
}
