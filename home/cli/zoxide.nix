{
  d.shell.aliases = {
    j = "__zoxide_zi";
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;

    options = [ "--no-cmd" ];
  };

  d.fs.persisted = {
    directories = [ ".local/share/zoxide" ];
  };
}
