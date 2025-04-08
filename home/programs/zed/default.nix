{config, pkgs, ...}:
{
  home.packages = with pkgs; [ zed-editor-fhs ];
  xdg.configFile."zed/settings.json".text= ''
  {
    "auto_install_extensions": {
      "biome": true,
      "catppuccin-icons": true,
      "charmed-icons": true,
      "colored-zed-icons-theme": true,
      "graphql": true,
      "html": true,
      "jetbrains-new-ui-icons": true,
      "material-icon-theme": true,
      "nix": true,
      "nordic-nvim-theme": true,
      "nordic-theme": true,
      "oxocarbon": true,
      "rose-pine-theme": true,
      "svelte": true,
      "vscode-icons": true
    },
    "autosave": "on_focus_change",
    "session": {
      "restore_unsaved_buffers": true
    },
    "features": {
      "edit_prediction_provider": "zed"
    },
    "ui_font_size": 12,
    "buffer_font_size": 12,
    "theme": {
      "mode": "system",
      "light": "Rosé Pine",
      "dark": "Rosé Pine"
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
      "mode": "subtle"
    }
  }

'';
}
