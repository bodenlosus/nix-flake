{ pkgs, config, ... }:
{
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Mod+Q".action = spawn "${pkgs.kitty}/bin/kitty";
    "Mod+E".action = spawn "${pkgs.nautilus}/bin/nautilus";
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

    "Print" = "screenshot";
    "Ctrl+Print" = "screenshot-screen";
    "Alt+Print" = "screenshot-window";

    "Ctrl+Alt+Delete" = quit;

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
    "Mod+Shift+Next" = move-window-down-or-to-workspace-down;
    "Mod+Shift+Prior" = move-window-up-or-to-workspace-up;
    "Mod+V" = toggle-window-floating;

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
    "Mod+Left".action = consume-window-into-column;
    "Mod+Right".action = expel-window-from-column;

    "MouseForward".action = focus-column-or-monitor-left;
    "MouseBack".action = focus-column-or-monitor-right;

    "Shift+MouseForward".action = move-column-left-or-to-monitor-left;
    "Shift+MouseBack".action = move-column-right-or-to-monitor-right;

    "Shift+MouseMiddle".action = switch-preset-column-width;
    "Shift+Mod+MouseMiddle".action = maximize-column;

    "Mod+Ctrl+Q" = maximize-column;
    "Mod+Shift+F" = fullscreen-window;

    "Mod+Shift+Q" = switch-preset-column-width;
    "Mod+Shift+C".action = spawn "clipboard";

    "Mod+Home".action = focus-window-previous;
  };
}
