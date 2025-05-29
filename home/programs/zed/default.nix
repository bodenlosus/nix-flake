{ config, pkgs, ... }: {
  home.packages = with pkgs; [ zed-editor-fhs ];
  xdg.configFile."zed/default-settings.json".text = ''
    {
      "assistant": {
        "inline_assistant_model": {
          "provider": "deepseek",
          "model": "deepseek-chat"
        },
        "default_model": {
          "provider": "deepseek",
          "model": "deepseek-chat"
        },
        "version": "2"
      },
      "auto_install_extensions": {
        "basedpyright": true,
        "basher": true,
        "biome": true,
        "blueprint": true,
        "catppuccin-icons": true,
        "charmed-icons": true,
        "colored-zed-icons-theme": true,
        "deno": true,
        "docker-compose": true,
        "dockerfile": true,
        "git-firefly": true,
        "github-theme": true,
        "graphql": true,
        "html": true,
        "ini": true,
        "jetbrains-new-ui-icons": true,
        "latex": true,
        "lua": true,
        "make": true,
        "material-icon-theme": true,
        "meson": true,
        "nix": true,
        "nordic-nvim-theme": true,
        "nordic-theme": true,
        "oxocarbon": true,
        "pylsp": true,
        "rose-pine-theme": true,
        "scss": true,
        "sql": true,
        "svelte": true,
        "toml": true,
        "vscode-icons": true,
        "xml": true,
        "zig": true
      },
      "language_models": {
        "deepseek": {
          "api_url": "https://api.deepseek.com",
          "available_models": [
            {
              "name": "deepseek-chat",
              "display_name": "DeepSeek Chat",
              "max_tokens": 64000
            },
            {
              "name": "deepseek-reasoner",
              "display_name": "DeepSeek Reasoner",
              "max_tokens": 64000,
              "max_output_tokens": 4096
            }
          ]
        }
      },

      "autosave": "on_focus_change",
      "session": {
        "restore_unsaved_buffers": true
      },
      "features": {
        "edit_prediction_provider": "zed"
      },
      "ui_font_size": 14,
      "buffer_font_size": 16,
      "theme": {
        "mode": "system",
        "light": "Github Dark",
        "dark": "Github Dark"
      },
      "outline_panel": {
        "dock": "right",
        "scrollbar": { "show": "never" }
      },
      "project_panel": {
        "dock": "right",
        "scrollbar": { "show": "never" }
      },
      "scrollbar": { "show": "never" },
      "icon_theme": "Charmed Icons",
      "vim_mode": true,
      "ui_font_family": "JetBrainsMono Nerd Font Propo",
      "buffer_font_family": "JetBrainsMono Nerd Font Mono",
      "git": {
        "git_gutter": "tracked_files",
        "inline_blame": { "enabled": true, "show_commit_summary": true },
        "hunk_style": null
      },
      "git_panel": { "dock": "left" },
      "terminal": {
        "dock": "bottom"
      },
      "toolbar": {
        "breadcrumbs": true,
        "quick_actions": true,
        "selections_menu": true
      },
      "gutter": {
        "folds": true,
        "line_numbers": true,
        "code_actions": true
      },
      "edit_predictions": {
        "mode": "eager"
      },
      "inlay_hints": {
        "enabled": true,
        "show_type_hints": true,
        "show_background": true
      },
      "enable_language_server": true,
      "languages": {
        "XML": { "formatter": "prettier", "tab_size": 2 }
      },
      "lsp": {
        "rust-analyzer": {
          "initialization_options": {
            "diagnostics": {
              "experimental": {
                "enable": true
              }
            }
          }
        }
      }
    }

  '';
}
