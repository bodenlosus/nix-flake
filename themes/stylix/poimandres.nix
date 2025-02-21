{ pkgs, inputs, ... }: {
  stylix = {
    enable = true;

    # Horizon Terminal
    base16Scheme = {
      base00 = "#1B1E28"; # Default Background
      base01 = "#303340"; # Lighter Background
      base02 = "#506477"; # Selection Background
      base03 = "#767C9D"; # Comments, Invisibles, Line Highlighting
      base04 = "#A6ACCD"; # Dark Foreground
      base05 = "#FAE4FC"; # Default Foreground, Caret, Delimiters, Operators
      base06 = "#E4F0FB"; # Light Foreground
      base07 = "#FFFFFF"; # Light Background (Not often used)
      base08 = "#D0679D"; # Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
      base09 = "#FFFAC2"; # Integers, Boolean, Constants, XML Attributes, Markup Link Url
      base0A = "#FCC5E9"; # Classes, Markup Bold, Search Text Background
      base0B = "#5DE4C7"; # Strings, Inherited Class, Markup Code, Diff Inserted
      base0C = "#5FB3A1"; # Support, Regular Expressions, Escape Characters, Markup Quotes
      base0D = "#89DDFF"; # Functions, Methods, Attribute IDs, Headings
      base0E = "#FAE4FC"; # Keywords, Storage, Selector, Markup Italic, Diff Changed
      base0F = "#91B4D5";
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
