{ pkgs, ... }: {
  wayland.windowManager.hyprland.extraConfig = ''
    # █░█░█ █ █▄░█ █▀▄ █▀█ █░█░█   █▀█ █░█ █░░ █▀▀ █▀
    # ▀▄▀▄▀ █ █░▀█ █▄▀ █▄█ ▀▄▀▄▀   █▀▄ █▄█ █▄▄ ██▄ ▄█

    # See https://wiki.hyprland.org/Configuring/Window-Rules/

    $op_high = 0.95
    $op_mid = 0.85
    $op_low = 0.8;

    windowrulev2 = opacity $op_high $op_high,class:^(firefox)$
    windowrulev2 = opacity $op_high $op_high,class:^(Brave-browser)$
    windowrulev2 = opacity $op_high $op_high,class:^(code-oss)$
    windowrulev2 = opacity $op_high $op_high,class:^(Code)$
    windowrulev2 = opacity $op_mid $op_mid,class:^(spotify)$
    windowrulev2 = opacity $op_mid $op_mid,initialTitle:^(spotify Free)$
    windowrulev2 = opacity $op_mid $op_mid,initialTitle:^(spotify Premium)$
    windowrulev2 = opacity $op_mid $op_mid,class:^(code-url-handler)$
    windowrulev2 = opacity $op_mid $op_mid,class:^(code-insiders-url-handler)$
    windowrulev2 = opacity $op_mid $op_mid,class:^(kitty)$
    windowrulev2 = opacity $op_mid $op_lowclass:^(wofi)$
    windowrulev2 = opacity $op_mid $op_mid,class:^(kitty)$
    windowrulev2 = opacity $op_mid $op_mid,class:^(.blueman-manager-wrapped)$
    windowrulev2 = opacity $op_mid $op_mid,class:^(io.github.kaii_lb.Overskride)$
    windowrulev2 = opacity $op_mid $op_mid,class:^(org.kde.dolphin)$
    windowrulev2 = opacity $op_mid $op_mid,class:^(org.gnome.Nautilus)$
    windowrulev2 = opacity $op_mid $op_mid,class:^(org.kde.ark)$
    windowrulev2 = opacity $op_mid $op_mid,class:^(nwg-look)$
    windowrulev2 = opacity $op_mid $op_mid,class:^(qt5ct)$
    windowrulev2 = opacity $op_mid $op_mid,class:^(qt6ct)$
    windowrulev2 = opacity $op_mid $op_mid,class:^(kvantummanager)$
    windowrulev2 = opacity $op_mid $op_low,class:^(org.pulseaudio.pavucontrol)$
    windowrulev2 = opacity $op_mid $op_low,class:^(blueman-manager)$
    windowrulev2 = opacity $op_mid $op_low,class:^(nm-applet)$
    windowrulev2 = opacity $op_mid $op_low,class:^(nm-connection-editor)$
    windowrulev2 = opacity $op_mid $op_low,class:^(org.kde.polkit-kde-authentication-agent-1)$
    windowrulev2 = opacity $op_mid $op_low,class:^(polkit-gnome-authentication-agent-1)$
    windowrulev2 = opacity $op_mid $op_low,class:^(org.freedesktop.impl.portal.desktop.gtk)$
    windowrulev2 = opacity $op_mid $op_low,class:^(org.freedesktop.impl.portal.desktop.hyprland)$
    windowrulev2 = opacity $op_low $op_low,class:^([Ss]team)$
    windowrulev2 = opacity $op_low $op_low,class:^(steamwebhelper)$


    windowrulev2 = opacity $op_high $op_high,class:^(com.github.rafostar.Clapper)$ # Clapper-Gtk
    windowrulev2 = opacity $op_mid $op_mid,class:^(com.github.tchx84.Flatseal)$ # Flatseal-Gtk
    windowrulev2 = opacity $op_mid $op_mid,class:^(hu.kramo.Cartridges)$ # Cartridges-Gtk
    windowrulev2 = opacity $op_mid $op_mid,class:^(com.obsproject.Studio)$ # Obs-Qt
    windowrulev2 = opacity $op_mid $op_mid,class:^(gnome-boxes)$ # Boxes-Gtk
    windowrulev2 = opacity $op_mid $op_mid,class:^(vesktop)$ # Vesktop
    windowrulev2 = opacity $op_mid $op_mid,class:^(vesktop)$ # Discord-Electron
    windowrulev2 = opacity $op_mid $op_mid,class:^(WebCord)$ # WebCord-Electron
    windowrulev2 = opacity $op_mid $op_mid,class:^(ArmCord)$ # ArmCord-Electron
    windowrulev2 = opacity $op_mid $op_mid,class:^(app.drey.Warp)$ # Warp-Gtk
    windowrulev2 = opacity $op_mid $op_mid,class:^(net.davidotek.pupgui2)$ # ProtonUp-Qt
    windowrulev2 = opacity $op_mid $op_mid,class:^(yad)$ # Protontricks-Gtk
    windowrulev2 = opacity $op_mid $op_mid,class:^(Signal)$ # Signal-Gtk
    windowrulev2 = opacity $op_mid $op_mid,class:^(io.github.alainm23.planify)$ # planify-Gtk
    windowrulev2 = opacity $op_mid $op_mid,class:^(io.gitlab.theevilskeleton.Upscaler)$ # Upscaler-Gtk
    windowrulev2 = opacity $op_mid $op_mid,class:^(com.github.unrud.VideoDownloader)$ # VideoDownloader-Gtk
    windowrulev2 = opacity $op_mid $op_mid,class:^(io.gitlab.adhami3310.Impression)$ # Impression-Gtk
    windowrulev2 = opacity $op_mid $op_mid,class:^(io.missioncenter.MissionCenter)$ # MissionCenter-Gtk
    windowrulev2 = opacity $op_mid $op_mid,class:^(io.github.flattool.Warehouse)$ # Warehouse-Gtk

    windowrulev2 = float,class:^(org.kde.dolphin)$,title:^(Progress Dialog — Dolphin)$
    windowrulev2 = float,class:^(org.kde.dolphin)$,title:^(Copying — Dolphin)$
    windowrulev2 = float,title:^(About Mozilla Firefox)$
    windowrulev2 = float,class:^(firefox)$,title:^(Picture-in-Picture)$
    windowrulev2 = float,class:^(firefox)$,title:^(Library)$
    windowrulev2 = float,class:^(kitty)$,title:^(top)$
    windowrulev2 = float,class:^(kitty)$,title:^(btop)$
    windowrulev2 = float,class:^(kitty)$,title:^(htop)$
    windowrulev2 = float,class:^(vlc)$
    windowrulev2 = float,class:^(kvantummanager)$
    windowrulev2 = float,class:^(qt5ct)$
    windowrulev2 = float,class:^(qt6ct)$
    windowrulev2 = float,class:^(nwg-look)$
    windowrulev2 = float,class:^(org.kde.ark)$
    windowrulev2 = float,class:^(org.pulseaudio.pavucontrol)$
    windowrulev2 = float,class:^(blueman-manager)$
    windowrulev2 = float,class:^(nm-applet)$
    windowrulev2 = float,class:^(nm-connection-editor)$
    windowrulev2 = float,class:^(org.kde.polkit-kde-authentication-agent-1)$

    windowrulev2 = float,class:^(Signal)$ # Signal-Gtk
    windowrulev2 = float,class:^(com.github.rafostar.Clapper)$ # Clapper-Gtk
    windowrulev2 = float,class:^(app.drey.Warp)$ # Warp-Gtk
    windowrulev2 = float,class:^(net.davidotek.pupgui2)$ # ProtonUp-Qt
    windowrulev2 = float,class:^(yad)$ # Protontricks-Gtk
    windowrulev2 = float,class:^(eog)$ # Imageviewer-Gtk
    windowrulev2 = float,class:^(io.github.alainm23.planify)$ # planify-Gtk
    windowrulev2 = float,class:^(io.gitlab.theevilskeleton.Upscaler)$ # Upscaler-Gtk
    windowrulev2 = float,class:^(com.github.unrud.VideoDownloader)$ # VideoDownloader-Gkk
    windowrulev2 = float,class:^(io.gitlab.adhami3310.Impression)$ # Impression-Gtk
    windowrulev2 = float,class:^(io.missioncenter.MissionCenter)$ # MissionCenter-Gtk


    # █░░ ▄▀█ █▄█ █▀▀ █▀█   █▀█ █░█ █░░ █▀▀ █▀
    # █▄▄ █▀█ ░█░ ██▄ █▀▄   █▀▄ █▄█ █▄▄ ██▄ ▄█

    layerrule = blur,rofi
    layerrule = ignorezero,rofi
    layerrule = blur,notifications
    layerrule = ignorezero,notifications
    layerrule = blur,swaync-notification-window
    layerrule = ignorezero,swaync-notification-window
    layerrule = blur,swaync-control-center
    layerrule = ignorezero,swaync-control-center
    layerrule = blur,logout_dialog
    layerrule = blur,bar-0
    layerrule = blur,bar-1
    layerrule = ignorezero,bar-0
    layerrule = ignorezero,bar-1
  '' + "\n" + builtins.concatStringsSep "\n" (map (layer: "layerrule = blur,${layer}\nlayerrule = ignorezero,${layer}") [
    "bar-0"
    "bar-1"
    "networkmenu"
    "bluetoothmenu"
    "audiomenu"
    "powermenu"
    "energymenu"
    "notifications-window"
    "calendarmenu"
    "notificationsmenu"
    "mediamenu"
    "dashboardmenu"
  ])
  ;
}
