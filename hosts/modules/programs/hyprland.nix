{pkgs, lib, ...}:

{
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;

  environment.systemPackages = [
    pkgs.pavucontrol
    pkgs.brightnessctl
    pkgs.pulseaudio
    pkgs.grim
    pkgs.hyprshot
  ];

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
}