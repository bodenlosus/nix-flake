# - ## System
#- 
#- Usefull quick scripts
#-
#- - `menu` - Open wofi with drun mode. (wofi)
#- - `powermenu` - Open power dropdown menu. (wofi)
#- - `lock` - Lock the screen. (hyprlock)
{ pkgs, ... }:

let
  menu = pkgs.writeShellScriptBin "menu"
    # bash
    ''
      rofi -show drun
      # if pgrep tofi; then
      # 	pkill tofi
      # else
      # 	tofi-drun --drun-launch=true
      # fi
    '';

  powermenu = pkgs.writeShellScriptBin "powermenu"
    # bash
    ''
            #/usr/bin/env bash
      options=(
          " 󰍃  Logout"
          "   Suspend"
          " 󰑐  Reboot"
          " 󰿅  Shutdown"
      )

      selected=$(printf '%s\n' "''${options[@]}" | rofi -no-show-icons -dmenu)
      selected=$(echo "$selected" | cut -d' ' -f4-)

      case $selected in
          "Logout")
          hyprctl dispatch exit
          ;;
          "Suspend")
          systemctl suspend
          ;;
          "Reboot")
          systemctl reboot
          ;;
          "Shutdown")
          systemctl poweroff
          ;;
      esac
    '';

  quickmenu = pkgs.writeShellScriptBin "quickmenu" ''

#/usr/bin/env bash
options=(
    " 󰅶  Caffeine"
    " 󰖔  Night-shift"
    "   Nixy"
    " 󰈊  Hyprpicker"
)

selected=$(printf '%s\n' "''${options[@]}" | rofi -no-show-icons -dmenu)
selected=$(echo "$selected" | cut -d' ' -f4-)

case $selected in
    "Caffeine")
    caffeine
    ;;
    "Night-shift")
    night-shift
    ;;
    "Nixy")
    kitty zsh -c nixy
    ;;
    "Hyprpicker")
    sleep 0.2
    ${pkgs.hyprpicker}/bin/hyprpicker -a
    ;;
esac
    '';

  lock = pkgs.writeShellScriptBin "lock"
    # bash
    ''
      ${pkgs.hyprlock}/bin/hyprlock
    '';

in
{ home.packages = [ menu powermenu lock quickmenu ]; }
