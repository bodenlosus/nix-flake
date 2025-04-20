{ pkgs, config, ... }:
let
  accent = "#${config.lib.stylix.colors.base0D}";
  accent-alt = "#${config.lib.stylix.colors.base03}";
  background = "#${config.lib.stylix.colors.base02}";
  background-alt = "#${config.lib.stylix.colors.base01}";
  border = "#${config.lib.stylix.colors.base03}";
  foreground = "#${config.lib.stylix.colors.base05}";
  font = "${config.stylix.fonts.serif.name}";
  font-size = "${toString config.stylix.fonts.sizes.desktop}";
  urgent = "#${config.lib.stylix.colors.base08}";
  rounding = config.var.theme.rounding;
  border-size = config.var.theme.border-size;

  gaps-out = config.var.theme.gaps-out;
  gaps-in = config.var.theme.gaps-in;

  floating = config.var.theme.bar.floating;
  transparent = config.var.theme.bar.transparent;
  position = config.var.theme.bar.position;
  fontWeight = "400";
  opacity = config.var.theme.system-opacity;

  location = config.var.location;
in
{
  home.packages = with pkgs; [ ironbar ];
  xdg.configFile."ironbar/config.toml".text = ''
    anchor_to_edges = true
    position = "bottom"
    icon_theme = "Nordzy-dark"
    height = 0
    [margin]
    bottom = 6

    # [[start]]
    # type = "workspaces"
    # all_monitors = false

    # [start.name_map]
    # 1 = "󰙯"
    # 2 = "icon:firefox"
    # 3 = ""
    # Games = "icon:steam"
    # Code = ""

    [[center]]
    type = "launcher"
    show_names = false
    show_icons = true
    icon_size = 20

    [[start]]
    type = "music"
    player_type = "mpris"

    [start.truncate]
    mode = "end"
    max_length = 50


    [[end]]
    type = "volume"
    format = "{icon} {percentage}%"
    max_volume = 100

    [end.icons]
    volume_high = "󰕾"
    volume_medium = "󰖀"
    volume_low = "󰕿"
    muted = "󰝟"

    [[end]]
    type = "clipboard"
    max_items = 3

    [end.truncate]
    mode = "end"
    length = 50

    [[end]]
    type="network_manager"

    [[end]]
    type = "clock"
    format = "%d.%m.%Y %H:%M"

    [[end]]
    type = "custom"
    class = "power-menu"
    tooltip = "Up: {{30000:uptime -p | cut -d ' ' -f2-}}"

    [[end.bar]]
    type = "button"
    name = "power-btn"
    label = ""
    on_click = "popup:toggle"

    [[end.popup]]
    type = "box"
    orientation = "vertical"

    [[end.popup.widgets]]
    type = "label"
    name = "header"
    label = "Power menu"

    [[end.popup.widgets]]
    type = "box"

    [[end.popup.widgets.widgets]]
    type = "button"
    class = "power-btn"
    label = "<span font-size='16pt'></span>"
    on_click = "!shutdown now"

    [[end.popup.widgets.widgets]]
    type = "button"
    class = "power-btn"
    label = "<span font-size='16pt'></span>"
    on_click = "!reboot"

    [[end.popup.widgets]]
    type = "label"
    name = "uptime"
    label = "Uptime: {{30000:uptime -p | cut -d ' ' -f2-}}"
  '';
  xdg.configFile."ironbar/style.css".text = ''
        @define-color color_bg ${background};
    @define-color color_bg_dark ${background-alt};
    @define-color color_border ${border};
    @define-color color_border_active ${accent};
    @define-color color_text ${foreground};
    @define-color color_urgent ${urgent};
    @define-color color_accent ${accent};

    /* -- base styles -- */

    * {
        font-family: ${font}, sans-serif;
        font-size: ${font-size}px;
        border: none;

    }

    box, menubar, button {
        background-color: @color_bg;
        background-image: none;
        box-shadow: none;
    }

    window, #bar {
        border-radius: ${toString rounding}px;
        background: transparent;
    }

    #start, #center, #end {
        background-color: @color_bg;
        padding: 0px;
        border: 1px solid @color_border;
    }

    #start * , #center * , #end * {
        background-color: transparent;
    }

    #start {
        border-radius: ${toString rounding}px;
    }

    #center {
        border-radius: ${toString rounding}px;
    }

    #end {
        border-radius: ${toString rounding}px;
    }




    button, label {
        color: @color_text;
    }

    button:hover {
        background-color: @color_bg_dark;
    }

    scale trough {
        min-width: 1px;
        min-height: 2px;
    }

    #bar {
        margin-left: ${toString gaps-out}px;
        margin-right: ${toString gaps-out}px;
        margin-top: 0px;
    }

    .popup {
        border: 1px solid @color_border;
        padding: 1em;
        border-radius: ${toString rounding}px;

    }


    /* -- clipboard -- */

    .clipboard {
        margin-left: 5px;
        font-size: 1.1em;
    }

    .popup-clipboard .item {
        padding-bottom: 0.3em;
        border-bottom: 1px solid @color_border;
    }


    /* -- clock -- */

    .clock {
        font-weight: bold;
        margin-left: 5px;
    }

    .popup-clock .calendar-clock {
        color: @color_text;
        font-size: 2.5em;
        padding-bottom: 0.1em;
    }

    .popup-clock .calendar {
        background-color: @color_bg;
        color: @color_text;
    }

    .popup-clock .calendar .header {
        padding-top: 1em;
        border-top: 1px solid @color_border;
        font-size: 1.5em;
    }

    .popup-clock .calendar:selected {
        background-color: @color_border_active;
    }


    /* -- launcher -- */

    .launcher .item {
        margin-right: 4px;
        background-color: transparent;
    }

    .launcher .ifix examtem:not(.focused):hover {
        background-color: transparent;
    }

    .launcher * {
        background-color: transparent;
    }

    .launcher .focused {
        border-radius: 0;
        border-bottom: 1px solid alpha(@color_border_active, 0.7);
    }

    .launcher .urgent {
        border-radius: 0;
        border-bottom: 1px solid alpha(@color_urgent, 0.7);
    }

    .popup-launcher {
        padding: 0;
    }

    .popup-launcher .popup-item:not(:first-child) {
        border-top: 1px solid @color_border;
    }


    /* -- music -- */

    .music:hover * {
        background-color: @color_bg_dark;
    }

    .popup-music .album-art {
        margin-right: 1em;
    }

    .popup-music .icon-box {
        margin-right: 0.4em;
    }

    .popup-music .title .icon, .popup-music .title .label {
        font-size: 1.7em;
    }

    .popup-music .controls *:disabled {
        color: @color_border;
    }

    .popup-music .volume .slider slider {
        border-radius: 100%;
    }

    .popup-music .volume .icon {
        margin-left: 4px;
    }

    .popup-music .progress .slider slider {
        border-radius: 100%;
    }

    /* notifications */

    .notifications .count {
        font-size: 0.6rem;
        background-color: @color_text;
        color: @color_bg;
        border-radius: 100%;
        margin-right: 3px;
        margin-top: 3px;
        padding-left: 4px;
        padding-right: 4px;
        opacity: 0.7;
    }

    /* -- script -- */

    .script {
        padding-left: 10px;
    }


    /* -- sys_info -- */

    .sysinfo {
        margin-left: 10px;
    }

    .sysinfo .item {
        margin-left: 5px;
    }


    /* -- tray -- */

    .tray {
        margin-left: 10px;
    }

    /* -- volume -- */

    .popup-volume .device-box {
        border-right: 1px solid @color_border;
    }

    /* -- workspaces -- */

    .workspaces .item.focused {
        box-shadow: inset 0 -3px;
        background-color: @color_bg_dark;
    }

    .workspaces .item.urgent {
        background-color: @color_urgent;
    }

    .workspaces .item:hover {
        box-shadow: inset 0 -3px;
    }


    /* -- custom: power menu -- */

    .popup-power-menu #header {
        font-size: 1.4em;
        padding-bottom: 0.4em;
        margin-bottom: 0.6em;
        border-bottom: 1px solid @color_border;
    }

    .popup-power-menu .power-btn {
        border: 1px solid @color_border;
        padding: 0.6em 1em;
    }

    .popup-power-menu #buttons > *:nth-child(1) .power-btn {
        margin-right: 1em;
    }
  '';
}
