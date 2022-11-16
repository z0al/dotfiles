lib: rec {
  # Borrowed as is from https://github.com/divnix/digga
  rakeLeaves =
    /*
     *
       Synopsis: rakeLeaves _path_

       Recursively collect the nix files of _path_ into attrs.

       Output Format:
       An attribute set where all `.nix` files and directories with `default.nix` in them
       are mapped to keys that are either the file with .nix stripped or the folder name.
       All other directories are recursed further into nested attribute sets with the same format.

       Example file structure:
       ```
       ./core/default.nix
       ./base.nix
       ./main/dev.nix
       ./main/os/default.nix
       ```

       Example output:
       ```
       {
       core = ./core;
       base = base.nix;
       main = {
       dev = ./main/dev.nix;
       os = ./main/os;
       };
       }
       ```
     *
     */
    dirPath:
    let
      seive = file: type:
        # Only rake `.nix` files or directories
        (type == "regular" && lib.hasSuffix ".nix" file) || (type == "directory");

      collect = file: type: {
        name = lib.removeSuffix ".nix" file;
        value =
          let
            path = dirPath + "/${file}";
          in
          if
            (type == "regular")
            || (type == "directory" && builtins.pathExists (path + "/default.nix"))
          then path
          # recurse on directories that don't contain a `default.nix`
          else rakeLeaves path;
      };

      files = lib.filterAttrs seive (builtins.readDir dirPath);
    in
    lib.filterAttrs (n: v: v != { }) (lib.mapAttrs' collect files);
}
