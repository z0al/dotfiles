channels: final: prev:

with final;
with final.lib;

let
  linux = channels.unstable.brave;

  darwin = stdenv.mkDerivation rec {
    inherit (channels.unstable.brave) pname version;
    appname = "Brave Browser";

    src = fetchurl {
      url = "https://github.com/brave/brave-browser/releases/download/v${version}/Brave-Browser-universal.dmg";
      sha256 = "sha256-wYXCl5KYqntNXllhwautBWDTsmfbyzkwgGd2/dRZRas=";
    };

    nativeBuildInputs = [ makeWrapper undmg ];

    dontConfigure = true;
    dontBuild = true;
    dontPatchELF = true;
    doInstallCheck = true;
    dontFixup = true;

    unpackPhase = ''
      undmg $src
    '';

    installPhase = ''
      runHook preInstall
      mkdir -p $out/{Applications,bin}
      cp -R "${appname}.app" $out/Applications
      makeWrapper "$out/Applications/${appname}.app/Contents/MacOS/${appname}" $out/bin/${pname}
      runHook postInstall
    '';

    meta.platforms = platforms.darwin;
  };
in

{
  __dontExport = true;

  brave = if stdenv.isDarwin then darwin else linux;
}
