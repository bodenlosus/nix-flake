{ pkgs, inputs, ... }: {
  stylix = {
    enable = true;

    # Horizon Terminal
    base16Scheme = {
      base00 = "#090E13";
      base01 = "#1C1E25";
      base02 = "#22262D";
      base03 = "#393B44";
      base04 = "#5C6066";
      base06 = "#A4A7A4";
      base05 = "#C5C9C7";
      base07 = "#f2f1ef";
      base08 = "#C34043";
      base09 = "#b6927b";
      base0A = "#DCA561";
      base0B = "#8a9a7b";
      base0C = "#8ea4a2";
      base0D = "#8ba4b0";
      base0E = "#8992a7";
      base0F = "#a292a3";
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
