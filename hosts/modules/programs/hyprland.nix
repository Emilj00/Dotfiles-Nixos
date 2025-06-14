{pkgs, ...}:

{
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; (config.environment.systemPackages or []) ++ [
    pavucontrol
    brightnessctl
    pulseaudio
  ];
}