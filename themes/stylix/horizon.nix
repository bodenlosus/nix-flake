{ pkgs, inputs, ... }: {
  stylix = {
    enable = true;

    # Horizon Terminal
    base16Scheme = {
      base00 = "#1C1E26";
      base01 = "#232530";
      base02 = "#2E303E";
      base03 = "#6F6F70";
      base04 = "#9DA0A2";
      base05 = "#CBCED0";
      base06 = "#DCDFE4";
      base07 = "#E3E6EE";
      base08 = "#E95678";
      base09 = "#FAB795";
      base0A = "#FAC29A";
      base0B = "#29D398";
      base0C = "#59E1E3";
      base0D = "#26BBD9";
      base0E = "#EE64AC";
      base0F = "#F09383";
    };

    cursor = {
      package = pkgs.whitesur-cursors;
      name = "WhiteSur-cursors";
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
    image = ./a.png;
  };
  stylix.targets.chromium.enable = true;
  stylix.targets.gtk.enable = true;
}
