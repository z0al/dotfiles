{ config, pkgs, lib, ... }:

let
  cfg = config.my.programs.vscode;
in

{
  my.programs.vscode = lib.mkIf cfg.enable (lib.mkMerge [
    # Theme
    {
      extensions = with pkgs.vscode-marketplace; [
        catppuccin.catppuccin-vsc
        pmndrs.pmndrs
      ];

      settings = {
        "workbench.colorTheme" = cfg.theme;
      };
    }

    # Gitlens
    {
      extensions = with pkgs.vscode-marketplace; [
        mk12.better-git-line-blame
      ];

      settings = {
        "betterGitLineBlame.annotateWholeLine" = false;
        "betterGitLineBlame.enableHoverMessages" = true;
        "betterGitLineBlame.ignoreWhitespaceChanges" = true;
        "betterGitLineBlame.showStatusBarItem" = false;
      };
    }

    # TypeScript
    {
      extensions = with pkgs.vscode-marketplace; [
        dbaeumer.vscode-eslint
      ];

      settings = {
        "typescript.updateImportsOnFileMove.enabled" = "always";
        "javascript.updateImportsOnFileMove.enabled" = "always";
        "typescript.preferences.preferTypeOnlyAutoImports" = true;
      };
    }

    # Prettier
    {
      extensions = with pkgs.vscode-marketplace; [
        esbenp.prettier-vscode
      ];

      settings = (lib.listToAttrs (map
        (lang: {
          name = "[${lang}]";
          value = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
        })
        [
          "css"
          "html"
          "javascript"
          "javascriptreact"
          "json"
          "jsonc"
          "markdown"
          "scss"
          "typescript"
          "typescriptreact"
        ])) // {
        "prettier.enable" = true;
        "prettier.semi" = true;
        "prettier.useTabs" = true;
      };
    }

    # Rust
    (lib.mkIf config.my.presets.rust.enable {
      extensions = with pkgs.vscode-marketplace; [
        rust-lang.rust-analyzer
      ];

      settings = {
        "rust-analyzer.inlayHints.chainingHints.enable" = false;
      };
    })

    # Copilot
    (lib.mkIf config.my.presets.copilot.enable {
      extensions = with pkgs.vscode-marketplace; [
        github.copilot
      ];

      settings = {
        "github.copilot.editor.enableCodeActions" = false;
      };
    })

    # Helix Emulation
    {
      extensions = with pkgs.vscode-marketplace; [
        jasew.vscode-helix-emulation
        wenfangdu.jump
      ];

      settings = {
        "extensions.experimental.affinity" = {
          "jasew.vscode-helix-emulation" = 1;
        };

        "jump.display.color" = "#000";
        "jump.display.backgroundColor" = "#ff0";
      };

      keybindings = [
        {
          key = "space b";
          command = "workbench.action.quickOpen";
          when = lib.concatStringsSep " && " [
            "editorTextFocus"
            "extension.helixKeymap.normalMode"
          ];
        }

        {
          key = "space f";
          command = "actions.find";
          when = lib.concatStringsSep " && " [
            "editorTextFocus"
            "extension.helixKeymap.normalMode"
          ];
        }

        {
          key = "space shift+f";
          command = "workbench.action.findInFiles";
          when = lib.concatStringsSep " && " [
            "editorTextFocus"
            "extension.helixKeymap.normalMode"
          ];
        }

        {
          key = "g w";
          command = "jump-extension.jump-to-the-start-of-a-word";
          when = lib.concatStringsSep " && " [
            "editorTextFocus"
            "extension.helixKeymap.normalMode"
          ];
        }
      ];
    }

    # Nix
    {
      packages = with pkgs; [
        nixd
      ];

      extensions = with pkgs.vscode-marketplace; [
        jnoortheen.nix-ide
      ];

      settings = {
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = lib.getExe pkgs.nixd;
        "nix.serverSettings" = {
          nixd.formatting.command = [ (lib.getExe pkgs.nixpkgs-fmt) ];
        };

        "nix.hiddenLanguageServerErrors" = [
          "textDocument/completion"
          "textDocument/definition"
          "textDocument/documentSymbol"
        ];
      };
    }

    # Python
    (lib.mkIf config.my.presets.python.enable {
      extensions = with pkgs.vscode-marketplace; [
        ms-python.black-formatter
        ms-python.python
        # FIXME: re-enable after v25.05
        # ms-python.vscode-pylance
      ];

      settings = {
        "[python]" = {
          "editor.defaultFormatter" = "ms-python.black-formatter";
        };

        "black-formatter.args" = [ "--line-length" "80" ];
      };
    })

    # Spellcheck
    {
      extensions = with pkgs.vscode-marketplace; [
        streetsidesoftware.code-spell-checker
      ];

      settings = {
        "cSpell.showStatus" = false;
        "cSpell.words" = [
          "Catppuccin"
          "Neovim"
          "NixOS"
        ];
      };
    }

    # Misc
    {
      extensions = with pkgs.vscode-marketplace; [
        bierner.markdown-footnotes
        bmalehorn.vscode-fish
        bradlc.vscode-tailwindcss
        dotjoshjohnson.xml
        editorconfig.editorconfig
        foxundermoon.shell-format
        hashicorp.terraform
        johnnymorganz.stylua
        okitavera.vscode-nunjucks-formatter
        qezhu.gitlink
        ronnidc.nunjucks
        sndst00m.vscode-native-svg-preview
        tamasfe.even-better-toml
        xaver.clang-format
        yzhang.markdown-all-in-one
      ];

      settings = {
        # Lua
        "[lua]" = {
          "editor.defaultFormatter" = "JohnnyMorganz.stylua";
        };

        # Shell Format
        "shellformat.useEditorConfig" = true;
        "shellformat.path" = lib.getExe pkgs.shfmt;

        # C/C++
        "[c]" = {
          "editor.defaultFormatter" = "xaver.clang-format";
        };

        # SVG fix
        # https://github.com/microsoft/vscode/issues/239834
        "workbench.editorAssociations" = {
          "*.svg" = "default";
        };
      };
    }
  ]);
}
