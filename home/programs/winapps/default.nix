{ pkgs, config, ... }:
{
  xdg.configFile."winapps/winapps.conf".text = ''
    RDP_USER="windows"
    RDP_PASS="windows"
    RDP_DOMAIN=""
    RDP_IP="127.0.0.1"
    WAFLAVOR="docker"
    RDP_SCALE="100"
    RDP_FLAGS="/cert:tofu /sound /microphone"
    MULTIMON="false"
    DEBUG="true"
    AUTOPAUSE="off"
    AUTOPAUSE_TIME="300"
    FREERDP_COMMAND="xfreerdp"
  '';
}
