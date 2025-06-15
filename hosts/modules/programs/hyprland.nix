{pkgs, lib, ...}:

{
  programs.hyprland.enable = true;

  environment.systemPackages = lib.mkAfter [
    pkgs.pavucontrol
    pkgs.brightnessctl
    pkgs.pulseaudio
  ];
}