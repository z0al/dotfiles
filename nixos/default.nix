{ hm, digga, ... }:

{
  hostDefaults = {
    system = "x86_64-linux";
    channelName = "stable";
    modules = [
      digga.nixosModules.nixConfig
      hm.nixosModules.home-manager
    ];
  };

  imports = [ (digga.lib.importHosts ./hosts) ];

  importables = rec {
    profiles = digga.lib.rakeLeaves ./profiles;
    suites = with profiles; rec {
      base = [ common boot.grub desktop.gnome ];

      sandbox = [ base ];
    };
  };
}
