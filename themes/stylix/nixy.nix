{ pkgs, inputs, ... }: {
  stylix = {
    enable = true;

    # Horizon Terminal
    base16Scheme = {
      base00 = "#070A11";
      base01 = "#0d1117";
      base02 = "#151b23";
      base03 = "#9198a1";
      base04 = "#656c76";
      base05 = "#f0f6fc";
      base06 = "#ffffff";
      base07 = "#ffffff";
      base08 = "#ff7b72";
      base09 = "#ffa657";
      base0A = "#d29922";
      base0B = "#3fb950";
      base0C = "#39c5cf";
      base0D = "#58a6ff";
      base0E = "#be8fff";
      base0F = "#eb3342";
    };

    cursor = {
      package = pkgs.whitesur-cursors;
      name = "WhiteSur-cursors";
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono Nerd Font";
      };
      sansSerif = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono Nerd Font";
      };
      serif = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono Nerd Font";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 11;
        desktop = 11;
        popups = 11;
        terminal = 11;
      };
    };
    opacity.terminal = 0.8;
    polarity = "dark";
    image = ./a.png;
  };
  stylix.targets.chromium.enable = true;
  stylix.targets.gtk.enable = true;
  # stylix.targets.hyprland.hyprpaper.enable = false;

  stylix.targets.nixvim.enable = false;
}
