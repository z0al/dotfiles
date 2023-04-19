{ lib, ... }:

{
  home.activation = {
    overrideDefaultKeyBindings = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      $DRY_RUN_CMD mkdir -p ~/Library/KeyBindings
      $DRY_RUN_CMD cp -f ${./keymap.dict} ~/Library/KeyBindings/DefaultKeyBinding.dict
    '';
  };
}
