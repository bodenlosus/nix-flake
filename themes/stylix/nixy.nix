{ pkgs, inputs, ... }: {
  stylix = {
    enable = true;

    # Edited catppuccin
    base16Scheme = {
      base00 = "272e33"; # bg0,       palette1 dark
      base01 = "2e383c"; # bg1,       palette1 dark
      base02 = "414b50"; # bg3,       palette1 dark
      base03 = "859289"; # grey1,     palette2 dark
      base04 = "9da9a0"; # grey2,     palette2 dark
      base05 = "d3c6aa"; # fg,        palette2 dark
      base06 = "edeada"; # bg3,       palette1 light
      base07 = "fffbef"; # bg0,       palette1 light
      base08 = "e67e80"; # red,       palette2 dark
      base09 = "e69875"; # orange,    palette2 dark
      base0A = "dbbc7f"; # yellow,    palette2 dark
      base0B = "a7c080"; # green,     palette2 dark
      base0C = "83c092"; # aqua,      palette2 dark
      base0D = "7fbbb3"; # blue,      palette2 dark
      base0E = "d699b6"; # purple,    palette2 dark
      base0F = "9da9a0"; # grey2,     palette2 dark
    };

    cursor = {
      package = pkgs.nordzy-cursor-theme;
      name = "Nordzy-cursors";
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
        name = "JetBrains Mono Nerd Font";
      };
      sansSerif = {
        package = pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; };
        name = "FiraCode Nerd Font";
      };
      serif = {
        package = pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; };
        name = "FiraCode Nerd Font";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 12;
        desktop = 12;
        popups = 12;
        terminal = 12;
      };
    };
    opacity.terminal = 0.8;
    polarity = "dark";
    image = ./forest.png;
  };
  stylix.targets.chromium.enable = true;
}
