{
  programs.fish.sources = [ "$HOME/.localrc" ];

  d.fs.persisted = {
    files = [ ".localrc" ];
  };
}
