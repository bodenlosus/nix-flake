{
  pkgs,
  config,
  lib,
  ...
}:
let
  colorsToYaml =
    s: lib.concatStringsSep "\n" (map (color: "\t\t - \"#${lib.toUpper color}\"") (builtins.attrValues s));

  color_string = colorsToYaml config.lib.stylix.colors;
  in
{
  home.packages = [ pkgs.gowall ];
  colors = builtins.attrValues;

  xdg.configFile."gowall/default-config.yaml".text = ''
    themes:
      - name: "system"
      ${color_string}
  '';
}
