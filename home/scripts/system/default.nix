# - ## System
#-
#- Usefull quick scripts
#-
#- - `menu` - Open wofi with drun mode. (wofi)
#- - `powermenu` - Open power dropdown menu. (wofi)
#- - `lock` - Lock the screen. (hyprlock)
{ pkgs, ... }:

let
  dmenu =
    {
      pl ? "",
    }:
    "${pkgs.vicinae}/bin/vicinae dmenu --placeholder \"${pl}\"";
  mirror =
    pkgs.writeScriptBin "screen-mirror" # nu
      ''
        #!/usr/bin/env nu
        let focused: string = niri msg --json focused-output | from json | get name
        let outputs: list = niri msg --json outputs | from json | columns 

        let unfocused_outputs = $outputs | where $it != $focused;

        let target = $unfocused_outputs | to text | ${dmenu { pl = "Select an output..."; }}

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
  menu = pkgs.writeScriptBin "menu" ''
    #!/usr/bin/env nu
    # if (pidof dms | is-not-empty ) {
    #   dms ipc call spotlight open
    # } else {
      vicinae open
    # }        
  '';

  powermenu = pkgs.writeScriptBin "powermenu" /* nu */ ''
    #!/usr/bin/env nu
    if (pidof dms | is-not-empty ) {
      dms ipc call powermenu open
      
    } else {
      let opts = {
        "󰍃  Logout": {|| niri msg action quit}
        "  Suspend": {|| systemctl suspend}
        "󰑐  Reboot": {|| systemctl reboot}
        "󰿅  Shutdown": {|| systemctl poweroff}
      }

      let selected = $opts | columns | str join "\n" | ${dmenu { pl = "Select an action ..."; }}

      do ($opts | get $selected)
    }
  '';

  quickmenu = pkgs.writeScriptBin "quickmenu" /* nu */ ''
      #!/usr/bin/env nu
      let opts = {
          "󰅶  Caffeine": {|| caffeine}
          "󰖔  Night-shift": {|| night-shift}
          "󰈊  Hyprpicker": {|| sleep 200ms;  ${pkgs.hyprpicker}/bin/hyprpicker -a}
      }

      let selected = $opts | columns | str join "\n" | ${dmenu { pl = "Select an action ..."; }}
      do ($opts | get $selected)
  '';

in
{
  home.packages = [
    menu
    powermenu
    quickmenu
    utsikt
    utsiktt
    clock
    mirror
  ];
}
