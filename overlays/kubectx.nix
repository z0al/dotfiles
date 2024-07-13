final: prev:

with final;
with final.lib;

{
  __dontExport = true;

  kubectx = stdenv.mkDerivation rec {
    pname = "kubectx";
    version = "0.8.0";

    src = fetchFromGitHub {
      owner = "ahmetb";
      repo = pname;
      rev = "v${version}";
      sha256 = "1wkvmic29mkzfs6619wjs3mya8ffigwv9n1w9y7zkfvpi8gxa0a6";
    };

    buildInputs = [ makeWrapper ];

    dontBuild = true;
    doCheck = false;

    installPhase = ''
      mkdir -p $out/bin
      mkdir -p $out/share/fish/vendor_completions.d

      cp kubectx $out/bin
      cp kubens $out/bin

      # Provide FISH completions
      cp completion/*.fish $out/share/fish/vendor_completions.d/

      for f in $out/bin/*; do
        wrapProgram $f --prefix PATH : ${makeBinPath [ unstable.kubectl ]}
      done
    '';

    meta = {
      description = "Fast way to switch between clusters and namespaces in kubectl!";
      license = licenses.asl20;
      homepage = https://github.com/ahmetb/kubectx;
      platforms = with platforms; unix;
    };
  };
}
