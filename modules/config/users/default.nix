{ pkgs, lib, ... }:

let
  username = "z0al";

  homeFolder =
    if pkgs.stdenv.isDarwin then
      "/Users/${username}"
    else
      "/home/${username}";
in

{
  imports = with lib; [
    (mkAliasOptionModule [ "my" "user" ] [ "users" "users" username ])

    (lib.mkAliasOptionModule [ "hm" ] [ "home-manager" "users" username ])

    (lib.mkAliasOptionModule
      [ "home" ]
      [ "home-manager" "users" username "home" ]
    )

    (lib.mkAliasOptionModule
      [ "xdg" ]
      [ "home-manager" "users" username "xdg" ]
    )
  ];

  # The typing system will take care of merging the extra options into the
  # native NixOS/nix-darwin module
  options.users.users =
    with lib;
    mkOption {
      type = types.attrsOf (
        types.submodule {
          options = {
            email = mkOption {
              type = types.str;
              description = ''
                Email address for the user. Used only for Git at the moment.
              '';
            };

            sshKey = mkOption {
              type = types.str;
              description = ''
                Public SSH key for the user. Used Git signing and authentication.
              '';
            };
          };
        }
      );
    };

  config = {
    my.user = {
      name = username;
      description = username;
      home = homeFolder;
      shell = pkgs.fish;
      email = "12673605+z0al@users.noreply.github.com";
      sshKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICINRjw8qGiYwNcKWWwiqcO1fV1ZbCfrvKBI+i/xjJ0e";
    };

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";

      users."${username}" = {
        home = {
          username = username;
          homeDirectory = homeFolder;
          stateVersion = lib.trivial.release;
        };

        xdg.enable = true;
        programs.home-manager.enable = true;
      };
    };
  };
}
