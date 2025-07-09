{pkgs, lib, ...}:

{
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;

  programs.gamescope.enable = true;
  programs.gamemode.enable = true;

  environment.systemPackages = [
    pkgs.heroic
    pkgs.prismlauncher

    pkgs.wineWowPackages.stable
    pkgs.umu-launcher
    pkgs.winetricks
    pkgs.p7zip
    pkgs.dxvk
    pkgs.vkd3d
  ];
}
