let
  prefix = "/opt/homebrew";
in

{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "uninstall";
    };

    taps = [
      "homebrew/services"
    ];
  };

  environment.variables = {
    HOMEBREW_AUTO_UPDATE_SECS = toString (60 * 60 * 24 * 7); # 1 week;
  };

  environment.interactiveShellInit = ''
    if [ -f ${prefix}/bin/brew ]; then
      eval "$(${prefix}/bin/brew shellenv)"
    fi
  '';

  d.programs.fish.interactiveShellInit = ''
    if test -d ${prefix}/share/fish/completions"
      set -p fish_complete_path ${prefix}/share/fish/completions
    end

    if test -d ${prefix}/share/fish/vendor_completions.d"
      set -p fish_complete_path ${prefix}/share/fish/vendor_completions.d
    end
  '';
}