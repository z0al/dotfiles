let
  path = "$HOME/.localrc";
in

{
  programs = {
    bash.extraSources = [ path ];
    fish.extraSources = [ path ];
  };

  d.fs.persisted = {
    files = [ ".localrc" ];
  };
}
