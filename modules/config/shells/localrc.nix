{
  environment.interactiveShellInit = ''
    if [ -f ~/.localrc ]; then
      source ~/.localrc
    fi
  '';
}
