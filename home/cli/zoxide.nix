{
  home.shellAliases = {
    j = "__zoxide_zi";
  };

  programs.zoxide = {
    enable = true;

    options = [ "--no-cmd" ];

    enableBashIntegration = true;
    enableFishIntegration = true;
  };

  d.fs.persisted = {
    directories = [ ".local/share/zoxide" ];
  };
}
