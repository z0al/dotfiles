{ user, ... }:

{
  environment.persistence."/nix/data" = {
    hideMounts = true;

    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/etc/NetworkManager/system-connections"
      { directory = "/var/lib/colord"; user = "colord"; group = "colord"; mode = "u=rwx,g=rx,o="; }
    ];

    files = [
      "/etc/machine-id"
    ];

    # This forces the creation of /nix/data/home/${user} which comes
    # in handy with the home-manager module later which has no root
    # access.
    users."${user}" = {
      directories = [
        "Downloads"
        "Music"
        "Pictures"
        "Documents"
        "Videos"
      ];
    };
  };

  # Required for home-manager module
  programs.fuse.userAllowOther = true;
}
