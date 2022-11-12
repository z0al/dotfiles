{ digga, ... }:

{
  imports = [ ];
  modules = [ ];

  importables = rec {
    profiles = digga.lib.rakeLeaves ./profiles;

    suites = with profiles; rec {
      base = [
        common
        term
        dev.common
        apps.common
      ];

      sandbox = [ base ];
    };
  };

  users = {
    z0al = { suites, ... }: {
      imports = suites.base;
    };
  };
}
