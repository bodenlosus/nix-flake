{ pkgs, inputs, ... }: {
  stylix = {
    enable = true;

    # Horizon Terminal
    base16Scheme = {
      base00 = "#181a23";
      base01 = "#282c3a";
      base02 = "#34394b";
      base03 = "#424960";
      base04 = "#545c78";
      base05 = "#abb1c5";
      base06 = "#d3d6e1";
      base07 = "#ffffff";
      base08 = "#7dbbe8";
      base09 = "#e87daa";
      base0A = "#7de8db";
      base0B = "#ffd3b3";
      base0C = "#e87d90";
      base0D = "#7ddbe8";
      base0E = "#a67de8";
      base0F = "#47c1d1";
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
