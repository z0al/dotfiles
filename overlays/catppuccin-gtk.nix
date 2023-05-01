channels: final: prev:
let
  oldColor = "#11111b";
  newColor = "#1e1e2e";
in
{
  __dontExport = true;

  catppuccin-gtk = (channels.unstable.catppuccin-gtk.override {
    accents = [ "lavender" ];
    size = "standard";
    tweaks = [ ];
    variant = "mocha";
  }).overrideAttrs (o: {
    postInstall = (o.postInstall or "") + ''
      grep -rlZ "${oldColor}" $out/share/themes --exclude-dir=.git | \
      xargs -0 sed -i 's/${oldColor}/${newColor}/g'
    '';
  });
}
