{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings."org/gnome/desktop/input-sources" = {
    sources = mkArray (type.tupleOf [ type.string type.string ]) [
      (mkTuple [ (mkString "xkb") (mkString "us") ])
      (mkTuple [ (mkString "xkb") (mkString "ara") ])
    ];
  };
}
