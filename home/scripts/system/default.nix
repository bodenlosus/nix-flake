# - ## System
#-
#- Usefull quick scripts
#-
#- - `menu` - Open wofi with drun mode. (wofi)
#- - `powermenu` - Open power dropdown menu. (wofi)
#- - `lock` - Lock the screen. (hyprlock)
{ pkgs, ... }:

let
  mirror =
    pkgs.writeScriptBin "screen-mirror" # nu
      ''            
        #!/usr/bin/env nu
        let focused: string = niri msg --json focused-output | from json | get name
        let outputs: list = niri msg --json outputs | from json | columns 

        let unfocused_outputs = $outputs | where $it != $focused;

        let target = $unfocused_outputs | to text | rofi -dmenu

        ${pkgs.wl-mirror}/bin/wl-mirror --fullscreen-output $target $focused
      '';
  clock =
    pkgs.writeScriptBin "clock" # nu
      ''
        #!/usr/bin/env nu
        kitten panel --output-name listjson | from json | each { |d| kitten panel -1 --instance-group 1 --layer background -o background_opacity=0 --detach --output-name $d.name clock-rs -i 1000 -s }
      '';
  utsiktt = pkgs.writeShellScriptBin "utsiktt" ''

    fd . $1  -a | \
    fzf \
    --preview-border=none \
    --no-separator \
    --border=none \
    --keep-right \
    --list-border=none \
    --highlight-line \
    --preview-window=right:30% \
    --padding=1 \
    --margin=1 \
    --no-scrollbar \
    --no-input \--preview=' \
      kitty icat \
      --clear \
      --transfer-mode=memory \
      --stdin=no \
      --scale-up \
      --place=''${FZF_PREVIEW_COLUMNS}x''${FZF_PREVIEW_LINES}@0x0 {} && \
      swww img {}'
  '';
  utsikt = pkgs.writeScriptBin "utsikt" ''
    kitty -o background_opacity=0 ${utsiktt}/bin/utsiktt $HOME/Pictures/wallpapers
  '';
  menu =
    pkgs.writeShellScriptBin "menu"
      # bash
      ''
        rofi -show drun
        # if pgrep tofi; then
        # 	pkill tofi
        # else
        # 	tofi-drun --drun-launch=true
        # fi
      '';

  powermenu =
    pkgs.writeShellScriptBin "powermenu"
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
            niri msg action quit
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
        "Hyprpicker")
        sleep 0.2
        ${pkgs.hyprpicker}/bin/hyprpicker -a
        ;;
    esac
  '';

  lock =
    pkgs.writeShellScriptBin "lock"
      # bash
      ''
        ${pkgs.hyprlock}/bin/hyprlock
      '';

in
{
  home.packages = [
    menu
    powermenu
    lock
    quickmenu
    utsikt
    utsiktt
    clock
    mirror
  ];
}
