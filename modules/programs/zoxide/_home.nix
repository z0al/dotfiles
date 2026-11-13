{
  config = {
    programs.zoxide = {
      options = [ "--no-cmd" ];
    };

    home.shellAliases = {
      j = "__zoxide_zi";
    };
  };
}
