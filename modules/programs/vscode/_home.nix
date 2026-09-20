{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfgPresets = config.presets;
  cfgFonts = config.fonts;

  mod = if pkgs.stdenv.isDarwin then "cmd" else "ctrl";

  cond = operants: lib.concatStringsSep " && " operants;
in

{
  config = {
    home.packages = [ pkgs.nixd ];

    programs.vscode = {
      enable = lib.mkDefault true;
      package = pkgs.vscode;
      mutableExtensionsDir = true;

      profiles.default = {
        enableUpdateCheck = false;
        enableExtensionUpdateCheck = false;

        extensions =
          (with pkgs.vscode-marketplace; [
            # Theme
            pmndrs.pmndrs

            # Git
            mk12.better-git-line-blame

            # TypeScript
            dbaeumer.vscode-eslint

            # Prettier
            esbenp.prettier-vscode

            # Nix
            jnoortheen.nix-ide

            # Claude Code
            anthropic.claude-code

            # Spellcheck
            streetsidesoftware.code-spell-checker

            # Misc
            bierner.markdown-footnotes
            bmalehorn.vscode-fish
            bradlc.vscode-tailwindcss
            dotjoshjohnson.xml
            editorconfig.editorconfig
            foxundermoon.shell-format
            johnnymorganz.stylua
            okitavera.vscode-nunjucks-formatter
            qezhu.gitlink
            ronnidc.nunjucks
            sndst00m.vscode-native-svg-preview
            tamasfe.even-better-toml
            xaver.clang-format
            yzhang.markdown-all-in-one
          ])
          ++ lib.optionals cfgPresets.rust.enable (
            with pkgs.vscode-marketplace; [ rust-lang.rust-analyzer ]
          )
          ++ lib.optionals cfgPresets.python.enable (
            with pkgs.vscode-marketplace;
            [
              charliermarsh.ruff
              ms-python.python
            ]
          );

        userSettings = {
          # Editor
          "files.enableTrash" = true;
          "editor.cursorSmoothCaretAnimation" = "on";
          "editor.cursorStyle" = "line";
          "editor.emptySelectionClipboard" = false;
          "editor.fontFamily" = lib.concatStringsSep "," [
            "'${cfgFonts.mono}'"
            "'${cfgFonts.symbol}'"
            "'${cfgFonts.emoji}'"
          ];
          "editor.fontSize" = 12;
          "editor.formatOnSave" = true;
          "editor.inlineSuggest.enabled" = true;
          "editor.insertSpaces" = false;
          "editor.lineNumbers" = "on";
          "editor.minimap.enabled" = false;
          "editor.occurrencesHighlight" = "off";
          "editor.renderWhitespace" = "none";
          "editor.selectionHighlight" = false;
          "editor.useTabStops" = true;
          "editor.wordWrap" = "on";
          "editor.accessibilitySupport" = "off";
          "diffEditor.ignoreTrimWhitespace" = false;
          "diffEditor.renderSideBySide" = false;
          "editor.scrollBeyondLastLine" = false;
          "editor.padding.bottom" = 100;
          "editor.guides.indentation" = false;

          # Workbench
          "workbench.iconTheme" = "vs-seti";
          "workbench.startupEditor" = "none";
          "workbench.editor.showTabs" = "single";
          "workbench.activityBar.location" = "hidden";
          "workbench.settings.editor" = "ui";
          "workbench.welcomePage.walkthroughs.openOnInstall" = false;
          "workbench.colorTheme" = "poimandres";
          "workbench.layoutControl.enabled" = false;

          # Window
          "window.menuBarVisibility" = "toggle";
          "window.commandCenter" = false;
          "window.zoomLevel" = 0.5;
          # Zoom In/Out then applies per-window instead of writing window.zoomLevel
          "window.zoomPerWindow" = true;

          # Security
          "security.workspace.trust.enabled" = false;

          # Explorer
          "explorer.confirmDelete" = false;
          "explorer.confirmDragAndDrop" = false;
          "explorer.openEditors.visible" = 0;

          "files.exclude" = {
            "**/.git" = true;
            "**/.DS_Store" = true;
            "**/Thumbs.db" = true;
            "**/dist" = true;
            "**/.swc" = true;
            "**/.turbo" = true;
          };

          # Search
          "search.showLineNumbers" = false;
          "search.exclude" = {
            "**/node_modules" = true;
            "**/dist" = true;
            "**/build" = true;
          };

          # Terminal
          "terminal.integrated.fontSize" = 12;
          "terminal.explorerKind" = "external";
          "terminal.integrated.tabs.enabled" = false;

          # Git
          "git.autofetch" = false;
          "git.autoStash" = true;
          "git.pullTags" = true;
          "git.enableCommitSigning" = true;
          "git.alwaysSignOff" = false;
          "git.suggestSmartCommit" = false;
          "git.confirmSync" = false;
          "git.openRepositoryInParentFolders" = "always";
          "scm.graph.showIncomingChanges" = "never";
          "scm.graph.showOutgoingChanges" = "never";

          # AI
          "chat.disableAIFeatures" = true;

          # Extensions
          "extensions.ignoreRecommendations" = true;
          "extensions.autoUpdate" = "on";

          # Telemetry
          "telemetry.telemetryLevel" = "off";
          "update.showReleaseNotes" = false;
          "breadcrumbs.enabled" = false;

          # Debug
          "debug.console.fontSize" = 12;

          # Emmet
          "emmet.includeLanguages" = {
            "nunjucks" = "html";
          };

          # Git blame
          "betterGitLineBlame.annotateWholeLine" = false;
          "betterGitLineBlame.enableHoverMessages" = true;
          "betterGitLineBlame.ignoreWhitespaceChanges" = true;
          "betterGitLineBlame.showStatusBarItem" = false;

          # TypeScript / JavaScript
          "js/ts.updateImportsOnFileMove.enabled" = "always";
          "js/ts.preferences.preferTypeOnlyAutoImports" = true;

          # Prettier
          "prettier.enable" = true;
          "prettier.semi" = true;
          "prettier.useTabs" = true;

          # Nix
          "nix.enableLanguageServer" = true;
          "nix.serverPath" = lib.getExe pkgs.nixd;
          "nix.serverSettings" = {
            nixd.formatting.command = [ "nixfmt" ];
          };
          "nix.hiddenLanguageServerErrors" = [
            "textDocument/completion"
            "textDocument/definition"
            "textDocument/documentSymbol"
          ];

          # Claude Code
          "claudeCode.preferredLocation" = "sidebar";
          "claudeCode.enableNewConversationShortcut" = false;
          "claudeCode.hideOnboarding" = true;

          # Spellcheck
          "cSpell.showStatus" = false;
          "cSpell.words" = [
            "Neovim"
            "NixOS"
          ];

          # Lua
          "[lua]" = {
            "editor.defaultFormatter" = "JohnnyMorganz.stylua";
          };

          # Shell
          "shellformat.useEditorConfig" = true;
          "shellformat.path" = lib.getExe pkgs.shfmt;

          # C/C++
          "[c]" = {
            "editor.defaultFormatter" = "xaver.clang-format";
          };
        }
        // lib.listToAttrs (
          map
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
            ]
        )
        // lib.optionalAttrs cfgPresets.rust.enable {
          "rust-analyzer.inlayHints.chainingHints.enable" = false;
        }
        // lib.optionalAttrs cfgPresets.python.enable {
          "[python]" = {
            "editor.defaultFormatter" = "charliermarsh.ruff";
          };
          "ruff.format.args" = [
            "--line-length"
            "80"
          ];
        };

        keybindings = [
          {
            key = "${mod}+space";
            command = "editor.action.triggerSuggest";
            when = cond [
              "editorHasCompletionItemProvider"
              "textInputFocus"
              "!editorReadonly"
              "!suggestWidgetVisible"
            ];
          }

          {
            key = "${mod}+shift+g";
            command = "workbench.view.scm";
            when = cond [
              "workbench.scm.active"
            ];
          }

          # Code Navigation
          {
            key = "${mod}+]";
            command = "workbench.action.navigateForward";
          }

          {
            key = "${mod}+[";
            command = "workbench.action.navigateBack";
          }

          # Extension: Markdown All In One
          # Restrict cmd+b & cmd+i shortcuts to selected text
          {
            key = "${mod}+b";
            command = "markdown.extension.editing.toggleBold";
            when = cond [
              "editorHasSelection"
              "!editorReadonly"
              "editorLangId =~ /^markdown$/"
            ];
          }

          {
            key = "${mod}+i";
            command = "markdown.extension.editing.toggleItalic";
            when = cond [
              "editorHasSelection"
              "!editorReadonly"
              "editorLangId =~ /^markdown$/"
            ];
          }

          {
            key = "${mod}+b";
            command = "-markdown.extension.editing.toggleBold";
            when = cond [
              "editorTextFocus"
              "!editorReadonly"
              "editorLangId =~ /^markdown$/"
            ];
          }

          {
            key = "${mod}+i";
            command = "-markdown.extension.editing.toggleItalic";
            when = cond [
              "editorTextFocus"
              "!editorReadonly"
              "editorLangId =~ /^markdown$/"
            ];
          }
        ];
      };
    };
  };
}
