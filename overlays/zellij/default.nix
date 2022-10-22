final: prev:
{
  zellij = prev.zellij.overrideAttrs (o: {
    patches = (o.patches or [ ]) ++ [
      ./locked-text.patch
    ];
  });
}
