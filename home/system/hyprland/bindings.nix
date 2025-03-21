{ pkgs, ... }: {
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mod,Q, exec, ${pkgs.kitty}/bin/kitty" # Kitty
      "$mod,E, exec, ${pkgs.nautilus}/bin/nautilus" # Thunar
      "$mod,X, exec, powermenu" # Powermenu
      "$mod,R, exec, menu" # Launcher
      "$mod,A, exec, quickmenu" # Quickmenu
      "$shiftMod,SPACE , exec, hyprfocus-toggle" # Toggle HyprFocus
      "$shiftMod,T, exec, hyprpanel-toggle" # Toggle hyprpanel


      "$mod,C, killactive," # Close window
      "$mod,T, togglefloating," # Toggle Floating
      "$mod,F, fullscreen" # Toggle Fullscreen
      "$mod,left, movefocus, l" # Move focus left
      "$mod,right, movefocus, r" # Move focus Right
      "$mod,up, movefocus, u" # Move focus Up
      "$mod,down, movefocus, d" # Move focus Down
      "$mod, TAB, scroller:toggleoverview" # Scroller Overview
      "$shiftMod,S, scroller:cycleheight, 1" # Cycle height
      "$shiftMod,A, scroller:cyclewidth, 1" # Cycle width
      "$shiftMod,W, scroller:setmode, c" # Set mode column
      "$shiftMod,D, scroller:setmode, r" # Set mode row
      "$shiftMod,Q, scroller:fitsize, active" # Maximize Window
      "$shiftMod,left, scroller:admitwindow" # Add to master
      "$shiftMod,right, scroller:expelwindow" # Remove from master
      "$shiftMod,code:190 , scroller:jump" # jump


      "$mod,PRINT, exec, screenshot window" # Screenshot window
      ",PRINT, exec, screenshot region" # Screenshot monitor
      "$shiftMod,PRINT, exec, screenshot monitor" # Screenshot region
      "ALT,PRINT, exec, screenshot region swappy" # Screenshot region then edit

      "$shiftMod,C, exec, clipboard" # Clipboard picker with wofi
      "$shiftMod,E, exec, ${pkgs.wofi-emoji}/bin/wofi-emoji" # Emoji picker with wofi
      "$mod,F2, exec, night-shift" # Toggle night shift
      "$mod,F3, exec, night-shift" # Toggle night shift
    ] ++ (builtins.concatLists (builtins.genList
      (i:
        let ws = i + 1;
        in [
          "$mod,code:1${toString i}, workspace, ${toString ws}"
          "$mod SHIFT,code:1${toString i}, movetoworkspace, ${toString ws}"
        ]) 9));

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
