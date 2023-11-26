{
  programs = {
    fish.extraSources = [ "$HOME/.localrc" ];
  };

  d.fs.persisted = {
    files = [ ".localrc" ];
  };
}
