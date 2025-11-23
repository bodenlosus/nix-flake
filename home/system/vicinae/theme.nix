{config, ...}: {
  x = ''
    [meta]
    version = 1
    name = "Catppuccin Mocha"
    description = "Cozy feeling with color-rich accents."
    variant = "dark"
    icon = "icons/catppuccin-mocha.png"
    inherits = "vicinae-dark"
    [colors.core]
    background = "${stylix.base00}"
    foreground = "${stylix.base05}"
    secondary_background = "${stylix.base01}"
    border = "${stylix.base03}"
    accent = "${stylix.base0D}"
    [colors.accents]
    blue = "${stylix.base0D}"
    green = "${stylix.base0B}"
    magenta = "${stylix.base0E}"
    orange = "${stylix.base09}"
    purple = "${stylix.base0E}"
    red = "${stylix.base08}"
    yellow = "${stylix.base0A}"
    cyan = "${stylix.base0C}"
  '';
}
