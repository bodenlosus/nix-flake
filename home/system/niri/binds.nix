{ pkgs, config, ... }: {
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Mod+Q".action.spawn = [ "${pkgs.kitty}/bin/kitty" "-1"];
    "Mod+E".action.spawn = [ "${pkgs.kitty}/bin/kitty" "-1" "yazi"];
    "Mod+X" = {
      cooldown-ms = 500;
      action.spawn = "powermenu";
    };
    "Mod+Y" = {
      cooldown-ms = 500;
      action.spawn = "quickmenu";
    };
    "Mod+R" = {
      cooldown-ms = 500;
      action.spawn = "menu";
    };

    "Mod+C".action = close-window;

    "Print".action.screenshot = [];
    "Ctrl+Print".action.screenshot-screen = [];
    "Alt+Print".action.screenshot-window = [];

    "Ctrl+Alt+Delete".action = quit;

    "Mod+Tab".action = toggle-overview;

    "Mod+A".action = focus-column-or-monitor-left;
    "Mod+S".action = focus-window-or-workspace-down;
    "Mod+W".action = focus-window-or-workspace-up;
    "Mod+D".action = focus-column-or-monitor-right;

    "Mod+Shift+A".action = move-column-left-or-to-monitor-left;
    "Mod+Shift+S".action = move-window-down-or-to-workspace-down;
    "Mod+Shift+W".action = move-window-up-or-to-workspace-up;
    "Mod+Shift+D".action = move-column-right-or-to-monitor-right;

    "Mod+Next".action = focus-window-or-workspace-down;
    "Mod+Prior".action = focus-window-or-workspace-up;
    "Mod+Shift+Next".action = move-window-down-or-to-workspace-down;
    "Mod+Shift+Prior".action = move-window-up-or-to-workspace-up;
    "Mod+V".action = toggle-window-floating;
    "Mod+period".action = set-dynamic-cast-window;
    "Mod+Shift+period".action = set-dynamic-cast-monitor;
    "Mod+Alt+period".action = clear-dynamic-cast-target;

    "Mod+WheelScrollDown" = {
      cooldown-ms = 500;
      action = focus-window-or-workspace-down;
    };
    "Mod+WheelScrollUp" = {
      cooldown-ms = 500;
      action = focus-window-or-workspace-up;
    };
    "Mod+Ctrl+WheelScrollDown" = {
      cooldown-ms = 500;
      action = move-window-up-or-to-workspace-up;
    };
    "Mod+Ctrl+WheelScrollUp" = {
      cooldown-ms = 500;
      action = move-window-down-or-to-workspace-down;
    };
    "Mod+Left".action = consume-or-expel-window-left;
    "Mod+Right".action = consume-or-expel-window-right;

    "Mod+Up".action = consume-window-into-column;
    "Mod+Down".action = expel-window-from-column;
    "MouseForward".action = focus-column-or-monitor-left;
    "MouseBack".action = focus-column-or-monitor-right;

    "Shift+MouseForward".action = move-column-left-or-to-monitor-left;
    "Shift+MouseBack".action = move-column-right-or-to-monitor-right;

    "Shift+MouseMiddle".action = switch-preset-column-width;
    "Shift+Mod+MouseMiddle".action = maximize-column;

    "Mod+Ctrl+Q".action = maximize-column;
    "Mod+Shift+F".action = fullscreen-window;

    "Mod+Shift+Q".action = switch-preset-column-width;
    "Mod+Shift+C".action.spawn = "clipboard";

    "Mod+Home".action = focus-window-previous;
    "XF86AudioRaiseVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+";
    "XF86AudioLowerVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-";
  };
}
