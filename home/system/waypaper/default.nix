{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Waypaper
    # waypaper
    swww

  ];
  # wayland.windowManager.hyprland.settings.exec-once = [ "swww-daemon" ];
  # xdg.configFile."waypaper/config.ini".text = ''
  #   [Settings]
  #   language = en
  #   folder = ~/Pictures/wallpapers
  #   backend = swww
  #   monitors = All
  #   fill = Fill
  #   sort = name
  #   color = #ffffff
  #   subfolders = False
  #   number_of_columns = 3
  #   post_command = 
  #   show_hidden = False
  #   show_gifs_only = False
  #   use_xdg_state = True
  #   swww_transition_type = any
  #   swww_transition_step = 90
  #   swww_transition_angle = 0
  #   swww_transition_duration = 2
  #   swww_transition_fps = 60
  # '';
}
