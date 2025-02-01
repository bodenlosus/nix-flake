{config, pkgs, ...}:
let 
  colors = config.lib.stylix.colors;
  gradient-colors = {
    "'gradient_color_1'" = colors.base08;
    "'gradient_color_2'" = colors.base0A;
    "'gradient_color_3'" = colors.base0B;
    "'gradient_color_4'" = colors.base0C;
    "'gradient_color_5'" = colors.base0D;
    "'gradient_color_6'" = colors.base0E;
    "'gradient_color_7'" = colors.base0F;
  }

in 
{
  programs.cava = {
    enable = true;
    settings = {
      general.framerate = 60;
      input.method = "pipewire";
      autosens = 1;

      smoothing.noise_reduction = 88;
      color = {
        gradient = 1;
        background = "'${base00}'";
        inherit gradient-colors
      };
    }
  }
}