{ pkgs, inputs, ... }: {
  stylix = {
    enable = true;

    # Edited catppuccin
    base16Scheme = {
      base00 = "2E3440"; # #2E3440
      base01 = "3B4252"; # #3B4252
      base02 = "434C5E"; # #434C5E
      base03 = "4C566A"; # #4C566A
      base04 = "D8DEE9"; # #D8DEE9
      base05 = "E5E9F0"; # #E5E9F0
      base06 = "ECEFF4"; # #ECEFF4
      base07 = "8FBCBB"; # #8FBCBB
      base08 = "BF616A"; # #BF616A
      base09 = "D08770"; # #D08770
      base0A = "EBCB8B"; # #EBCB8B
      base0B = "A3BE8C"; # #A3BE8C
      base0C = "88C0D0"; # #88C0D0
      base0D = "81A1C1"; # #81A1C1
      base0E = "B48EAD"; # #B48EAD
      base0F = "5E81AC"; # #5E81AC
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
    image = ./street_blues.png;
  };
  stylix.targets.chromium.enable = true;
}
