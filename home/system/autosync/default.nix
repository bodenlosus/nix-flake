{ config, pkgs, ... }:
let
  gitbin = ''${pkgs.git}/bin/git'';
in
{
  wayland.windowManager.hyprland.settings.exec-once =
    [ ''cd ${config.var.configDirectory} && ${gitbin} pull origin'' ];
}
