channels: final: prev: {
  linux-dynamic-wallpapers = prev.stdenv.mkDerivation rec {
    name = "linux-dynamic-wallpapers";
    version = "8904f832affb667c2926061d8e52b9131687451b";

    src = prev.fetchFromGitHub {
      owner = "saint-13";
      repo = "Linux_Dynamic_Wallpapers";
      rev = "${version}";
      sha256 = "ljg1a2D3syYbCDrXap5fZtWZD4ZNxUq/1sMLlXnuW58=";
    };

    postPatch = ''
      grep -rlZ "/usr/share" . --exclude-dir=.git | xargs -0 sed -i 's@/usr/share@'$out'/share@g'
    '';

    dontConfigure = true;
    dontBuild = true;
    dontFixup = true;

    installPhase = ''
      mkdir -p $out/share/backgrounds
      mkdir -p $out/share/gnome-background-properties

      cp -r ./Dynamic_Wallpapers/ $out/share/backgrounds/
      cp ./xml/* $out/share/gnome-background-properties/
    '';
  };
}
