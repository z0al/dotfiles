# Copied and modified from Nixpkgs
# https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nix-ld.nix
#
# Should no longer be needed after NixOS 23.05
{ config, pkgs, lib, ... }:

let
  nix-ld-so = pkgs.runCommand "ld.so" { } ''
    ln -s "$(cat '${pkgs.stdenv.cc}/nix-support/dynamic-linker')" $out
  '';

  # Thanks to Mic92
  # https://github.com/Mic92/dotfiles/blob/main/nixos/modules/nix-ld.nix
  libraries = with pkgs; [
    stdenv.cc.cc
    zlib
    fuse3
    alsa-lib
    at-spi2-atk
    at-spi2-core
    atk
    cairo
    cups
    curl
    dbus
    expat
    fontconfig
    freetype
    gdk-pixbuf
    glib
    gtk3
    libGL
    libappindicator-gtk3
    libdrm
    libnotify
    libpulseaudio
    libuuid
    xorg.libxcb
    libxkbcommon
    mesa
    nspr
    nss
    pango
    pipewire
    systemd
    icu
    openssl
    xorg.libX11
    xorg.libXScrnSaver
    xorg.libXcomposite
    xorg.libXcursor
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXi
    xorg.libXrandr
    xorg.libXrender
    xorg.libXtst
    xorg.libxkbfile
    xorg.libxshmfence
    zlib
  ];

  nix-ld-libraries = pkgs.buildEnv {
    name = "lb-library-path";
    pathsToLink = [ "/lib" ];
    paths = map lib.getLib libraries;
    extraPrefix = "/share/nix-ld";
    ignoreCollisions = true;
  };
in

{
  systemd.tmpfiles.packages = [ pkgs.nix-ld ];

  environment.systemPackages = [ nix-ld-libraries ];

  environment.pathsToLink = [ "/share/nix-ld" ];

  environment.variables = {
    NIX_LD = toString nix-ld-so;
    NIX_LD_LIBRARY_PATH = "/run/current-system/sw/share/nix-ld/lib";
  };
}
