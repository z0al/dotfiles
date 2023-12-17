{
  d.shell.sources = [ "$HOME/.localrc" ];

  d.fs.persisted = {
    files = [ ".localrc" ];
  };
}
