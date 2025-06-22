{ config, pkgs, lib, hostName, ... }:

let
  configDir = ../config/hypr;

  hardwareConf = if hostName == "gigabyte-host" then ''
    env = LIBVA_DRIVER_NAME,nvidia
    env = __GLX_VENDOR_LIBRARY_NAME,nvidia
    env = GBM_BACKEND,nvidia-drm
    env = __GL_GSYNC_ALLOWED,0
    env = __GL_VRR_ALLOWED,0
    env = WLR_RENDERER,vulkan
    env = WLR_NO_HARDWARE_CURSORS,1
    env = NVD_BACKEND,direct
  '' else "";
in
{
  home.file.".config/hypr/hardware.conf".text = hardwareConf;

  home.file.".config/hypr/hyprland.conf".source = "${configDir}/hyprland.conf";
  home.file.".config/hypr/keybinds.conf".source = "${configDir}/keybinds.conf";
  home.file.".config/hypr/launchers.conf".source = "${configDir}/launchers.conf";
  home.file.".config/hypr/monitors.conf".source = "${configDir}/monitors.conf";
  home.file.".config/hypr/workspaces.conf".source = "${configDir}/workspaces.conf";
}
