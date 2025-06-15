{ pkgs, ... }:
let
  extensions = with pkgs.gnomeExtensions; [
    paperwm
    just-perfection
    user-themes
    alphabetical-app-grid
  ];
in {
  home.packages = (with pkgs; [ gnome-tweaks gnome-extension-manager ])
    ++ extensions;
  dconf.settings = {
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" =
      {
        binding = "<Super>q";
        command = "kitty";
        name = "Launch Kitty";
      };
    "org/gnome/mutter" = {
      overlay-key = ""; # This disables the Super key overlay
    };
    "org/gnome/desktop/peripherals/keyboard" = {
      repeat = true;
      delay = 300;
      repeat-interval = 20;
    };
    "org/gnome/desktop/wm/preferences" = { button-layout = ""; };
    "org/gnome/desktop/wm/keybindings" = {
      switch-applications = [ ];
      switch-applications-backward = [ ];
    };
    "org/gnome/shell" = {

      enabled-extensions = builtins.map (v: v.extensionUuid) extensions;
    };
    "org/gnome/shell/keybindings" = {
      toggle-application-view = [ "<Super>r" ];
      toggle-overview = [ "<Super>Tab" ];
    };
    "org/gnome/shell/extensions/just-perfection" = {
      accent-color-icon = false;
      alt-tab-icon-size = 0;
      alt-tab-window-preview-size = 0;
      animation = 3;
      controls-manager-spacing-size = 0;
      dash = false;
      dash-icon-size = 16;
      looking-glass-width = 0;
      max-displayed-search-results = 0;
      panel = true;
      panel-in-overview = true;
      support-notifier-showed-version = 34;
      support-notifier-type = 0;
      switcher-popup-delay = false;
      top-panel-position = 0;
      window-preview-caption = false;
      workspace = false;
      workspace-background-corner-size = 13;
      workspace-peek = false;
      workspace-popup = false;
      workspace-switcher-size = 0;
      workspaces-in-app-grid = false;
    };
    "org/gnome/shell/extensions/paperwm" = {
      show-window-position-bar = false;
      selection-border-radius-bottom = 16;
      selection-border-radius-top = 16;
      selection-border-size = 10;
      window-gap = 12;
      horizontal-margin = 12;
      vertical-margin = 12;
      vertical-margin-bottom = 12;
      cycle-width-steps = [ 0.333 0.5 0.666 1.0 ];
      cycle-height-steps = [ 0.5 1.0 ];
      use-default-background = true;
    };
    "org/gnome/shell/extensions/paperwm/keybindings" = {
      barf-out = [ "" ];
      barf-out-active = [ "<Super>Down" ];
      center-horizontally = [ "" ];
      center-vertically = [ "" ];
      close-window = [ "<Super>c" ];
      cycle-height-backwards = [ "" ];
      cycle-width = [ "<Shift><Super>q" ];
      cycle-width-backwards = [ "" ];
      drift-left = [ "" ];
      drift-right = [ "" ];
      live-alt-tab = [ "" ];
      live-alt-tab-backward = [ "" ];
      live-alt-tab-scratch = [ "" ];
      live-alt-tab-scratch-backward = [ "" ];
      move-down = [ "<Shift><Super>s" ];
      move-down-workspace = [ "<Control><Super>s" ];
      move-left = [ "<Shift><Super>a" ];
      move-monitor-above = [ "" ];
      move-monitor-below = [ "" ];
      move-monitor-left = [ "" ];
      move-monitor-right = [ "" ];
      move-previous-workspace = [ "" ];
      move-previous-workspace-backward = [ "" ];
      move-right = [ "<Shift><Super>d" ];
      move-space-monitor-above = [ "" ];
      move-space-monitor-below = [ "" ];
      move-space-monitor-left = [ "" ];
      move-space-monitor-right = [ "" ];
      move-up = [ "<Shift><Super>w" ];
      move-up-workspace = [ "<Control><Super>w" ];
      new-window = [ "" ];
      paper-toggle-fullscreen = [ "<Shift><Super>f" ];
      previous-workspace = [ "" ];
      previous-workspace-backward = [ "" ];
      resize-h-dec = [ "" ];
      resize-h-inc = [ "" ];
      resize-w-dec = [ "" ];
      resize-w-inc = [ "" ];
      slurp-in = [ "<Super>Up" ];
      swap-monitor-above = [ "" ];
      swap-monitor-below = [ "" ];
      swap-monitor-left = [ "" ];
      swap-monitor-right = [ "" ];
      switch-down = [ "" ];
      switch-down-loop = [ "" ];
      switch-down-or-else-workspace = [ "<Super>s" ];
      switch-down-workspace = [ "" ];
      switch-focus-mode = [ "" ];
      switch-global-left = [ "<Super>a" ];
      switch-global-right = [ "<Super>d" ];
      switch-global-up = [ "" ];
      switch-left = [ "" ];
      switch-left-loop = [ "" ];
      switch-monitor-left = [ "<Control><Super>d" ];
      switch-monitor-right = [ "<Control><Super>a" ];
      switch-next = [ "" ];
      switch-open-window-position = [ "" ];
      switch-previous = [ "" ];
      switch-right = [ "" ];
      switch-right-loop = [ "" ];
      switch-up = [ "" ];
      switch-up-loop = [ "" ];
      switch-up-or-else-workspace = [ "<Super>w" ];
      switch-up-workspace = [ "" ];
      toggle-maximize-width = [ "" ];
      toggle-scratch = [ "<Super>v" ];
      toggle-scratch-window = [ "" ];
      toggle-top-and-position-bar = [ "" ];
    };
  };
}
