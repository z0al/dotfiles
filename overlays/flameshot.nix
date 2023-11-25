channels: final: prev:

with final;
with final.lib;

let
  linux = prev.flameshot;

  darwin = prev.flameshot.overrideAttrs (o: {
    nativeBuildInputs = (o.nativeBuildInputs or [ ]) ++ [ makeWrapper ];
    installPhase = ''
      runHook preInstall
      mkdir -p $out/{Applications,bin}
      cp -R src/${o.pname}.app $out/Applications
      makeWrapper $out/Applications/${o.pname}.app/Contents/MacOS/${o.pname} $out/bin/${o.pname}
      runHook postInstall
    '';
  });
in

{
  __dontExport = true;

  flameshot = if stdenv.isDarwin then darwin else linux;
}
