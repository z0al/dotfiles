{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.bash;
in

{
  imports = with lib; [
    (mkAliasOptionModule
      [ "d" "programs" "bash" "interactiveShellInit" ]
      [ "programs" "bash" "interactiveShellInit" ])
  ];

  options.d.programs.bash = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.bash = {
      completion.enable = true;

      # https://github.com/mrzool/bash-sensible
      interactiveShellInit = ''
        ## GENERAL OPTIONS ##

        # Prevent file overwrite on stdout redirection
        # Use `>|` to force redirection to an existing file
        set -o noclobber

        # Update window size after every command
        shopt -s checkwinsize

        # Enable history expansion with space
        # E.g. typing !!<space> will replace the !! with your last command
        bind Space:magic-space

        # Turn on recursive globbing (enables ** to recurse all directories)
        shopt -s globstar 2> /dev/null

        # Case-insensitive globbing (used in pathname expansion)
        shopt -s nocaseglob;

        ## SMARTER TAB-COMPLETION (Readline bindings) ##

        # Perform file completion in a case insensitive fashion
        bind "set completion-ignore-case on"

        # Treat hyphens and underscores as equivalent
        bind "set completion-map-case on"

        # Display matches for ambiguous patterns at first tab press
        bind "set show-all-if-ambiguous on"

        # Immediately add a trailing slash when autocompleting symlinks to
        # directories
        bind "set mark-symlinked-directories on"

        ## SANE HISTORY DEFAULTS ##

        # Append to the history file, don't overwrite it
        shopt -s histappend

        # Save multi-line commands as one command
        shopt -s cmdhist

        # Record each line as it gets issued
        PROMPT_COMMAND='history -a'

        # Huge history. Doesn't appear to slow things down, so why not?
        HISTSIZE=500000
        HISTFILESIZE=100000

        # Avoid duplicate entries
        HISTCONTROL="erasedups:ignoreboth"

        # Don't record some commands
        export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

        # Use standard ISO 8601 timestamp
        # %F equivalent to %Y-%m-%d
        # %T equivalent to %H:%M:%S (24-hours format)
        HISTTIMEFORMAT='%F %T '

        # Enable incremental history search with up/down arrows (also Readline
        # goodness).
        bind '"\e[A": history-search-backward'
        bind '"\e[B": history-search-forward'
        bind '"\e[C": forward-char'
        bind '"\e[D": backward-char'

        ## BETTER DIRECTORY NAVIGATION ##

        # Prepend cd to directory names automatically
        shopt -s autocd 2> /dev/null
        # Correct spelling errors during tab-completion
        shopt -s dirspell 2> /dev/null
        # Correct spelling errors in arguments supplied to cd
        shopt -s cdspell 2> /dev/null

        ## OTHER ##

        # Disable bell
        set bell-style none
      '';
    };
  };
}
