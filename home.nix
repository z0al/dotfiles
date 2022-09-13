# https://www.bekk.christmas/post/2021/16/dotfiles-with-nix-and-home-manager
# https://www.youtube.com/watch?v=AGVXJ-TIv3Y
# What is left?
# * Add nvim / gnvim support
# * Add VS Code support
# * Add GNOME extensions

{ config, pkgs, ... }:

{
  home.username = "z0al";
  home.homeDirectory = "/home/z0al";
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    curl
    gnupg
    fnm
    fd

    # Fonts
    (nerdfonts.override {
      fonts = [ "FiraCode" ];
    })
  ];

  # Needed for Nerd Fonts
  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs.fzf = {

    # #!/bin/zsh

    # # loads fzf if installed via git
    # [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

    # # Setting fd as the default source for fzf
    # export FZF_DEFAULT_COMMAND="fdfind --type f --max-depth 10"
    # export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --height=30%"

    # # ALT-C - cd into the selected directory.
    # export FZF_ALT_C_COMMAND="fdfind --type d ---max-depth 10"

    # # CTRL-T - Paste the selected files and directories onto the command-line.
    # export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

    # # Use fd instead of find for fzf completion
    # _fzf_compgen_path() {
    # 	eval $FZF_DEFAULT_COMMAND . "$1"
    # }

    # _fzf_compgen_dir() {
    # 	eval $FZF_ALT_C_COMMAND . "$1"
    # }

    enable = true;

    enableFishIntegration = true;

    defaultCommand = "fd --type f --max-depth 10";
    defaultOptions = [ "--layout=reverse" "--inline-info" "--height=50%" ];
    changeDirWidgetCommand = "fd --type d --max-depth 10";
    fileWidgetCommand = config.programs.fzf.defaultCommand;
  };

  programs.git = {
    enable = true;

    userName = "Ahmed T. Ali";
    userEmail = "ah.tajelsir@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
    };

    signing = {
      key = "DD0C59367BABDC35";
      signByDefault = true;
    };

    aliases = {
      co = "checkout";
      br = "branch";
      st = "status";
      cm = "commit -m";
    };

    # https://dandavison.github.io/delta
    delta = {
      enable = true;

      options = {
        line-numbers = true;
        features = "decorations";
        decorations = {
          hunk-header-style = "omit";
        };
      };
    };
  };


  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      battery = {
        disabled = true;
      };

      cmd_duration = {
        format = "[$duration]($style)";
      };
    };
  };

  programs.alacritty = {
    enable = true;

    settings = {
      window.title = "Terminal";

      font = {
        size = 11;
        normal = {
          family = "Fira Code";
        };
      };

      cursor = {
        style = {
          shape = "Block";
          blinking = "On";
        };
      };

      # Theme Poimandres
      colors = {
        # Default colors
        primary = {
          background = "0x1b1e28";
          foreground = "0xa6accd";
        };

        # Cursor colors
        cursor = {
          text = "CellBackground";
          cursor = "CellForeground";
        };

        # Search colors
        #
        # Colors used for the search bar and match highlighting.
        search = {
          # Allowed values are "CellForeground"/"CellBackground", which reference the
          # affected cell, or hexadecimal colors like #ff00ff.
          matches = {
            foreground = "0x1b1e28";
            background = "0xadd7ff";
          };

          focused_match = {
            foreground = "0x1b1e28";
            background = "0xadd7ff";
          };

          bar = {
            foreground = "0x1b1e28";
            background = "0xadd7ff";
          };
        };

        # Selection colors
        #
        # Colors which should be used to draw the selection area.
        #
        # Allowed values are "CellForeground"/"CellBackground", which reference the
        # affected cell, or hexadecimal colors like #ff00ff.
        selection = {
          text = "CellForeground";
          background = "0x303340";
        };

        # Vi mode cursor colors
        #
        # Colors for the cursor when the vi mode is active.
        #
        # Allowed values are "CellForeground"/"CellBackground", which reference the
        # affected cell, or hexadecimal colors like #ff00ff.
        vi_mode_cursor = {
          text = "CellBackground";
          cursor = "CellForeground";
        };

        # Normal colors
        normal = {
          black = "0x1b1e28";
          red = "0xd0679d";
          green = "0x5de4c7";
          yellow = "0xfffac2";
          blue = "0x89ddff";
          magenta = "0xfcc5e9";
          cyan = "0xadd7ff";
          white = "0xffffff";
        };

        # Bright colors
        bright = {
          black = "0xa6accd";
          red = "0xd0679d";
          green = "0x5de4c7";
          yellow = "0xfffac2";
          blue = "0xadd7ff";
          magenta = "0xfae4fc";
          cyan = "0x89ddff";
          white = "0xffffff";
        };
      };
    };
  };

  programs.bat = {
    enable = true;
  };

  programs.fish = {
    enable = true;

    shellInit =
      ''
        # Disable greeting message
        set -U fish_greeting

        # Bind CTRL+Backspace to delete a word
        bind \b backward-kill-word

        # JS
        fnm env --use-on-cd | source
      '';

    shellAliases = {
      cat = "bat";
      nvm = "fnm";
      open = "xdg-open &>/dev/null";
    };

    shellAbbrs = {
      ".." = "cd ..";
      "..." = "cd ../..";

      g = "git";
      hm = "home-manager";
    };

    functions = {
      mkd = "mkdir -p $argv && cd $argv";
    };

    plugins = [
      {
        name = "fzf";
        src = pkgs.fetchFromGitHub {
          owner = "PatrickF1";
          repo = "fzf.fish";
          rev = "v9.1";
          sha256 = "OLmPtgUVX+/uiZg6lMl1xF4MHGVZUpTVota68coexWw=";
        };
      }

      {
        name = "z";
        src = pkgs.fetchFromGitHub {
          owner = "jethrokuan";
          repo = "z";
          rev = "85f863f20f24faf675827fb00f3a4e15c7838d76";
          sha256 = "+FUBM7CodtZrYKqU542fQD+ZDGrd2438trKM0tIESs0=";
        };
      }
    ];
  };

  dconf = {
    enable = true;

    settings = {
      "org/gnome/desktop/interface" = {
        # Use Dark mode for Legacy apps e.g. Alacritty
        gtk-theme = "Adwaita-dark";
      };
    };
  };
}
