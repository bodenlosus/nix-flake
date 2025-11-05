{
  inputs,
  config,
  lib,
  ...
}:
let

  background = "#${config.lib.stylix.colors.base00}";
  border-size = config.var.theme.border-size;
  rounding = config.var.theme.rounding;
  keyboardLayout = config.var.keyboardLayout;
  accent = "#${config.lib.stylix.colors.base0D}";
  accent-alt = "#${config.lib.stylix.colors.base03}";
  blur = config.var.theme.blur;
  gaps-in = config.var.theme.gaps-in;
  gaps-out = config.var.theme.gaps-out;
in
{
  imports = [ inputs.mango.hmModules.mango ];

  wayland.windowManager.mango = {
    enable = true;
    settings = ''

      exec-once=swww-daemon
      enable_hotarea=0

      bind=SUPER,q,spawn,kitty -1 -o "background_opacity=.9"
      bind=SUPER,c,killclient
      bind=SUPER,y,spawn,quickmenu
      bind=SUPER,x,spawn,powermenu
      bind=SUPER,r,spawn,menu
      bind=SUPER,w,focusdir,up
      bind=SUPER,a,focusdir,left
      bind=SUPER,s,focusdir,down
      bind=SUPER,d,focusdir,right
      bind=SUPER+SHIFT,w,exchange_client,up
      bind=SUPER+SHIFT,a,exchange_client,left
      bind=SUPER+SHIFT,s,exchange_client,down
      bind=SUPER+SHIFT,d,exchange_client,right
      bind=SUPER+SHIFT,q,switch_proportion_preset
      bind=SUPER+SHIFT,f,togglefullscreen
      bind=SUPER,Tab,toggleoverview
      bind=CTRL+ALT,Del,quit
      rootcolor=${background}
      bordercolor=${accent-alt}
      focuscolor=${accent}
      borderpx=${toString border-size}
      gappov=${toString gaps-in}        
      gappiv=${toString gaps-in}        
      gappoh=${toString gaps-in}        
      gappih=${toString gaps-in}        
      border_radius=${toString rounding}
      repeat_rate=50
      repeat_delay=300
      xkb_rules_layout=${keyboardLayout}

      scroller_default_proportion=0.5
      scroller_proportion_preset=0.333333,0.5,0.666666,1
      blur=1
      blur_layer=0
      blur_params_radius=10
      blur_params_num_passes=3
      blur_params_brightness=1
      blur_params_noise=0

      blur_params_contrast=1
      blur_params_saturation=1
      blur_optimized=1
    '';
    autostart_sh = ''
      # see autostart.sh
      # Note: here no need to add shebang
    '';
  };
}
