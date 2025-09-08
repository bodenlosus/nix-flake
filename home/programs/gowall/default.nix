{
  pkgs,
  config,
  lib,
  ...
}:
let
  colors = with config.lib.stylix.colors; [
    base00
    base01
    base02
    base03
    base04
    base05
    base06
    base07
    base08
    base09
    base0A
    base0B
    base0C
    base0D
    base0F
  ];
  formatColor = color: "     - \"#${lib.toUpper color}\"";
  colorsToYaml = colors: lib.concatStringsSep "\n" (map formatColor colors);

  color_string = colorsToYaml colors;
in
{
  home.packages = [ pkgs.gowall ];

  xdg.configFile."gowall/default-config.yaml".text = ''
    themes:
      - name: "system"
        colors:
    ${color_string}
  '';
}
