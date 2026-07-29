{
  # Backs users.users.<user>.shell / /etc/shells (config/users/default.nix)
  programs.fish = {
    enable = true;
    useBabelfish = true;

    vendor.config.enable = true;
    vendor.functions.enable = true;
    vendor.completions.enable = true;
  };

  programs.bash.completion.enable = true;
}
