{ pkgs, ... }: {
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mod,Q, exec, ${pkgs.kitty}/bin/kitty" # Kitty
      "$mod,E, exec, ${pkgs.nautilus}/bin/nautilus" # Thunar
      "$mod,X, exec, powermenu" # Powermenu
      "$mod,R, exec, menu" # Launcher
      "$mod,Y, exec, quickmenu" # Quickmenu
      "$shiftMod,SPACE , exec, hyprfocus-toggle" # Toggle HyprFocus
      "$shiftMod,T, exec, hyprpanel-toggle" # Toggle hyprpanel

      "$mod,C, killactive," # Close window
      "$mod,T, togglefloating," # Toggle Floating
      "$mod,F, fullscreen" # Toggle Fullscreen
      "$mod,A, movefocus, l" # Move focus left
      "$mod,D, movefocus, r" # Move focus Right
      "$mod,W, movefocus, u" # Move focus Up
      "$mod,S, movefocus, d" # Move focus <D-d>Down
      "$mod, TAB, scroller:toggleoverview" # Scroller Overview
      "$shiftMod,S, movewindow, d" # Cycle height
      "$shiftMod,A, movewindow, l" # Cycle width
      "$shiftMod,W, movewindow, u" # Set mode column
      "$shiftMod,D, movewindow, r" # Set mode row
      "$shiftMod,Q, scroller:cyclesize, 1" # Maximize Window
      "$mod,left, scroller:admitwindow" # Add to master
      "$mod,right, scroller:expelwindow" # Remove from master
      "$shiftMod,code:190 , scroller:jump" # jump
      "$mod,1, workspace, -1"
      "$mod,2, workspace, +1"

      "$shiftMod,1, movetoworkspace, -1"
      "$shiftMod,2, movetoworkspace, +1"

      "$mod,PRINT, exec, screenshot window" # Screenshot window
      ",PRINT, exec, screenshot region" # Screenshot monitor
      "$shiftMod,PRINT, exec, screenshot monitor" # Screenshot region
      "ALT,PRINT, exec, screenshot region swappy" # Screenshot region then edit

      "$shiftMod,C, exec, clipboard" # Clipboard picker with wofi
      "$shiftMod,E, exec, ${pkgs.wofi-emoji}/bin/wofi-emoji" # Emoji picker with wofi
      "$mod,F2, exec, night-shift" # Toggle night shift
      "$mod,F3, exec, night-shift" # Toggle night shift
    ];

    bindm = [
      "$mod,mouse:272, movewindow" # Move Window (mouse)
      "$mod,R, resizewindow" # Resize Window (mouse)
    ];

    bindl = [
      ",XF86AudioMute, exec, sound-toggle" # Toggle Mute
      ",XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause" # Play/Pause Song
      ",XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next" # Next Song
      ",XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous" # Previous Song
      ",switch:Lid Switch, exec, ${pkgs.hyprlock}/bin/hyprlock" # Lock when closing Lid
    ];

    bindle = [
      ",XF86AudioRaiseVolume, exec, sound-up" # Sound Up
      ",XF86AudioLowerVolume, exec, sound-down" # Sound Down
      ",XF86MonBrightnessUp, exec, brightness-up" # Brightness Up
      ",XF86MonBrightnessDown, exec, brightness-down" # Brightness Down
    ];

  };
}
