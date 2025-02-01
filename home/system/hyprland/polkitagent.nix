{ inputs, pkgs, ... }: {
  home.packages =
    [ pkgs.hyprpolkitagent ];
  # inputs.hyprpolkitagent.packages."${pkgs.system}".hyprpolkitagent
  wayland.windowManager.hyprland.settings.exec-once =
    [ "systemctl --user start hyprpolkitagent" ];
}
