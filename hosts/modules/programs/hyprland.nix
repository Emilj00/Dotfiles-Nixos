{pkgs, lib, ...}:

{
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;

  environment.systemPackages = lib.mkAfter [
    pkgs.pavucontrol
    pkgs.brightnessctl
    pkgs.pulseaudio
    pkgs.bemenu
    pkgs.grim
    pkgs.hyprshot
  ];

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
}