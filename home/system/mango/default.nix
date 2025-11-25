{
  inputs,
  config,
  lib,
  ...
}:
let

  background = "0x${config.lib.stylix.colors.base00}";
  border-size = config.var.theme.border-size;
  rounding = config.var.theme.rounding;
  keyboardLayout = config.var.keyboardLayout;
  accent = "0x${config.lib.stylix.colors.base0D}";
  border = "0x${config.lib.stylix.colors.base03}";
  accent-alt = "0x${config.lib.stylix.colors.base03}";
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

      bind=SUPER,q,spawn,kitty -1 -o "background_opacity=.8"
      bind=SUPER,c,killclient
      bind=SUPER,y,spawn,quickmenu
      bind=SUPER,x,spawn,powermenu
      bind=SUPER,r,spawn,menu
      bind=SUPER,w,viewtoleft_have_client
      bind=SUPER,a,focusdir,left
      bind=SUPER,s,viewtoright_have_client
      bind=SUPER,d,focusdir,right
      bind=SUPER+SHIFT,w,tagtoleft
      bind=SUPER+SHIFT,a,exchange_client,left
      bind=SUPER+SHIFT,s,tagtoright
      bind=SUPER+SHIFT,d,exchange_client,right
      bind=SUPER+SHIFT,q,switch_proportion_preset
      bind=SUPER+SHIFT,f,togglefullscreen
      bind=SUPER,Tab,toggleoverview
      bind=SUPER+SHIFT,Tab,comboview
      bind=CTRL+ALT,Del,quit
      rootcolor=${background}
      focuscolor=${accent-alt}
      bordercolor=${border}
      borderpx=${toString border-size}
      gappov=${toString gaps-out}        
      gappiv=${toString gaps-out}        
      gappoh=${toString gaps-out}        
      gappih=${toString gaps-out}        
      border_radius=${toString rounding}
      repeat_rate=50
      repeat_delay=300
      xkb_rules_layout=${keyboardLayout}

      
      tag_animation_direction=0      
      layer_animations=1
      layer_shadows=1
      
      shadows_size=0
      shadows_blur=0
      shadows_position_y=-10
      scroller_default_proportion=0.5
      scroller_proportion_preset=0.333333,0.5,0.666666,1
      scroller_prefer_center=1

      blur=1
      blur_layer=1
      blur_params_radius=10
      blur_params_num_passes=3
      blur_params_brightness=1
      blur_params_noise=0

      blur_params_contrast=1
      blur_params_saturation=1
      blur_optimized=1

      sloppyfocus=0
    '';
    autostart_sh = ''
      # see autostart.sh
      # Note: here no need to add shebang
    '';
  };
}
