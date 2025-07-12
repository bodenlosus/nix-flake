{ pkgs, config, ... }:
let

  stylix = config.lib.stylix.colors.base00;
  accent = "#${config.lib.stylix.colors.base0D}";
  accent-alt = "#${config.lib.stylix.colors.base03}";
  background = "#${config.lib.stylix.colors.base00}";
  background-alt = "#${config.lib.stylix.colors.base02}";
  border = "#${config.lib.stylix.colors.base04}";
  foreground = "#${config.lib.stylix.colors.base05}";
  font = "${config.stylix.fonts.serif.name}";
  fontSize = "${toString config.stylix.fonts.sizes.desktop}";
  border-size = config.var.theme.border-size;
  gaps-in = config.var.theme.gaps-in;
  gaps-out = config.var.theme.gaps-out;
  active-opacity = config.var.theme.active-opacity;
  inactive-opacity = config.var.theme.inactive-opacity;
  rounding = config.var.theme.rounding;
  blur = config.var.theme.blur;
  keyboardLayout = config.var.keyboardLayout;
in
{
  imports = [ ./binds.nix ];
  programs.niri.settings = {
    spawn-at-startup = [
      { command = [ "${pkgs.swww}/bin/swww-daemon" ]; }

    ];
    screenshot-path = "~/Pictures/Screenshots/%Y-%m-%d %H-%M-%S.png";
    hotkey-overlay.skip-at-startup = true;
    clipboard.disable-primary = true;
    prefer-no-csd = true;
    environment = {
      "XDG_CURRENT_DESKTOP" = "Niri";
      "MOZ_ENABLE_WAYLAND" = "1";
      "ANKI_WAYLAND" = "1";
      "NIXOS_OZONE_WL" = "1";
      "XDG_SESSION_DESKTOP" = "Niri";
      "QT_AUTO_SCREEN_SCALE_FACTOR" = "1";
      "QT_QPA_PLATFORM" = "wayland";
      "QT_WAYLAND_DISABLE_WINDOWDECORATION" = "1";
      "ELECTRON_OZONE_PLATFORM_HINT" = "auto";
      "GTK_THEME" = "adw-gtk3";
      "__GL_GSYNC_ALLOWED" = "0";
      "__GL_VRR_ALLOWED" = "0";
      "DISABLE_QT5_COMPAT" = "0";
      "WLR_DRM_NO_ATOMIC" = "1";
      "WLR_BACKEND" = "vulkan";
      "WLR_RENDERER" = "vulkan";
      "WLR_NO_HARDWARE_CURSORS" = "1";
      "XDG_SESSION_TYPE" = "wayland";
      "SDL_VIDEODRIVER" = "wayland";
      "CLUTTER_BACKEND" = "wayland";
      "DISPLAY" = ":0";
      "QT_QPA_PLATFORMTHEME" = "gtk3";
    };
    input = {
      focus-follows-mouse = {
        enable = true;
        max-scroll-amount = "10%";
      };
      keyboard = {
        xkb.layout = "de";
        repeat-delay = 300;
        repeat-rate = 50;
      };
      touchpad = {
        tap = true;
        natural-scroll = true;
        click-method = "clickfinger";
      };
    };
    layout = {
      default-column-display = "tabbed";
      empty-workspace-above-first = true;
      gaps = gaps-out;
      center-focused-column = "on-overflow";
      always-center-single-column = true;

      background-color = "transparent";
      focus-ring = {
        width = border-size;
        active.color = accent;
      };
      border = {
        width = border-size;
        active.color = accent;
        inactive.color = border;
      };
      preset-column-widths = [
        { proportion = 1.0 / 3.0; }
        { proportion = 1.0 / 2.0; }
        { proportion = 1.0 / 1.0; }
        { proportion = 2.0 / 3.0; }
      ];
      default-column-width = {
        proportion = 1.0 / 2.0;
      };

      tab-indicator = {
        enable = true;
        corner-radius = rounding + 0.0;
        hide-when-single-tab = true;
        position = "right";
        length.total-proportion = 0.3333333;
      };
    };

    overview = {
      backdrop-color = background;
    };
    layer-rules = [
      {
        matches = [ { namespace = "swww-daemon"; } ];
        place-within-backdrop = true;
      }
    ];

    window-rules = [
      {
        geometry-corner-radius =
          let
            r = rounding + 0.0;
          in
          {
            top-left = r;
            top-right = r;
            bottom-left = r;
            bottom-right = r;
          };
        clip-to-geometry = true;
        draw-border-with-background = false;
      }
    ];
  };
  services.mako.enable = true;
  services.mako.settings = {
    border-radius = rounding;
    border-size = border-size;
    padding = "6";
  };
}
