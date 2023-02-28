{ config, ... }:

{
  xdg.configFile."karabiner" = {
    source = config.lib.file.mkOutOfStoreSymlink ../karabiner;
  };
}
