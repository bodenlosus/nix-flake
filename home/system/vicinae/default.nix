{
  pkgs,
  config,
  inputs,
  lib,
  ...
}:
{
  imports = [
    inputs.vicinae.homeManagerModules.default
  ];

  xdg.configFile."system.toml".source =
    let
      stylix = config.lib.stylix.colors;
      toml = pkgs.formats.toml { };
      theme = {
        version = 1;
        name = "Catppuccin Mocha";
        description = "Cozy feeling with color-rich accents.";
        variant = "dark";
        inherits = "vicinae-dark";
        colors.core = {
          background = "#${stylix.base00}";
          foreground = "#${stylix.base05}";
          secondary_background = "#${stylix.base01}";
          border = "#${stylix.base03}";
          accent = "#${stylix.base0D}";
        };
        colors.accents = {
          blue = "#${stylix.base0D}";
          green = "#${stylix.base0B}";
          magenta = "#${stylix.base0E}";
          orange = "#${stylix.base09}";
          purple = "#${stylix.base0E}";
          red = "#${stylix.base08}";
          yellow = "#${stylix.base0A}";
          cyan = "#${stylix.base0C}";
        };
      };
    in
    toml.generate "system.toml" theme;
  services.vicinae = {
    enable = true; # default: false
    package = pkgs.vicinae;
    settings = {
      closeOnFocusLoss = true;
      considerPreedit = false;
      faviconService = "twenty";
      font = {
        normal = "Inter";
        size = 11;
      };
      keybinding = "default";
      keybinds = { };
      popToRootOnClose = true;
      rootSearch = {
        searchFiles = true;
      };
      theme = {
        iconTheme = "Nordzy-cyan";
        name = "stylix";
      };
      window = {
        csd = true;
        opacity = lib.mkForce 1.0;
        rounding = 10;
      };
    };

  };
}
