{ pkgs, inputs, ... }: {
  stylix = {
    enable = true;

    # Edited catppuccin
    base16Scheme = {
      base00 = "24283b";
      base01 = "1f2335";
      base02 = "292e42";
      base03 = "565f89";
      base04 = "a9b1d6";
      base05 = "c0caf5";
      base06 = "c0caf5";
      base07 = "c0caf5";
      base08 = "f7768e";
      base09 = "ff9e64";
      base0A = "e0af68";
      base0B = "9ece6a";
      base0C = "1abc9c";
      base0D = "41a6b5";
      base0E = "bb9af7";
      base0F = "ff007c";
    };

    cursor = {
      package = pkgs.nordzy-cursor-theme;
      name = "Nordzy-cursors";
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.fira-mono;
        name = "FiraMono Nerd Font";
      };
      sansSerif = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font";
      };
      serif = {
        package = pkgs.nerd-fonts.fira-code;
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
    image = ./a.jpg;
  };
  stylix.targets.chromium.enable = true;
  stylix.targets.gtk.enable = true;
}
