{ config, lib, ... }:
let
  hexToRgb = hex: {
    r = lib.fromHexString (builtins.substring 0 2 hex);
    g = lib.fromHexString (builtins.substring 2 2 hex);
    b = lib.fromHexString (builtins.substring 4 2 hex);
  };
  darkenRgb =
    f:
    {
      r,
      g,
      b,
    }:
    {
      r = builtins.floor (r * f);
      b = builtins.floor (b * f);
      g = builtins.floor (g * f);
    };
  mixRgb =
    f: c1: c2:
    let
      mixComponent =
        f: a: b:
        builtins.floor ((1 - f) * a + (f * b));
    in
    {
      r = mixComponent f c1.r c2.r;
      b = mixComponent f c1.b c2.b;
      g = mixComponent f c1.g c2.g;
    };

  pad =
    l: s:
    let
      padLen = lib.max 0 (l - (lib.stringLength s));
      padStr = lib.concatStrings (lib.replicate padLen "0");
    in
    padStr + s;

  rgbToHex =
    hex:
    let
      s = lib.mapAttrs (k: v: pad 2 (lib.toLower (lib.toHexString v))) hex;
    in
    "${s.r}${s.g}${s.b}";
  darkenHex =
    hex: f:
    lib.pipe hex [
      hexToRgb
      (darkenRgb f)
      rgbToHex
    ];
  mixHex =
    f: hex1: hex2:
    let
      c1 = hexToRgb hex1;
      c2 = hexToRgb hex2;
      res = mixRgb f c1 c2;
    in
    rgbToHex res;

in
{

  programs.dankMaterialShell = {
    enable = true;

    # Core features
    enableSystemd = false; # Systemd service for auto-start
    enableSystemMonitoring = true; # System monitoring widgets (dgop)
    enableClipboard = true; # Clipboard history manager
    enableVPN = false; # VPN management widget
    enableBrightnessControl = true; # Backlight/brightness controls
    enableColorPicker = true; # Color picker tool
    enableDynamicTheming = false; # Wallpaper-based theming (matugen)
    enableAudioWavelength = false; # Audio visualizer (cava)
    enableCalendarEvents = true; # Calendar integration (khal)
    enableSystemSound = true; # System sound effects

  };

  xdg.configFile."dms/system.json".text =
    let
      stylix = config.lib.stylix.colors;
      primary = stylix.base0D;
      background = stylix.base00;
      surface = stylix.base01;
      foreground = stylix.base07;
      foreground-muted = stylix.base06;
      colors = builtins.mapAttrs (k: v: "#${v}") {
        inherit primary background surface;
        primaryText = background;
        primaryContainer = mixHex 0.8 background primary;
        backgroundText = foreground;
        surfaceContainer = stylix.base00;
        surfaceContainerHigh = stylix.base01;
        surfaceContainerHighest = stylix.base02;
        surfaceVariant = stylix.base00;
        surfaceText = foreground-muted;
        surfaceTint = background;
        outline = stylix.base04;
        error = stylix.base08;
        warning = stylix.base0A;
        info = primary;
      };
    in
    (builtins.toJSON (colors // { name = "System"; }));
}
