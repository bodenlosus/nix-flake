{ pkgs, inputs, ... }: {
  stylix = {
    enable = true;

    # Horizon Terminal
    base16Scheme = {
      base00 = "#0B0B0F";
      base01 = "#161616";
      base02 = "#16161E";
      base03 = "#46474F";
      base04 = "#9099A1";
      base05 = "#E6E6E6";
      base06 = "#F0F0F0";
      base07 = "#ffffff";
      base08 = "#D84F68";
      base09 = "#F9B98C";
      base0A = "#FFA16C";
      base0B = "#54C0A3";
      base0C = "#9592A4";
      base0D = "#E6E7A3";
      base0E = "#9099A1";
      base0F = "#479FFA";
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
        package = pkgs.noto-fonts-emoji;
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
