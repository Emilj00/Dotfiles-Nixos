{pkgs, lib, ...}:

{
  environment.systemPackages = lib.mkAfter [
    pkgs.wineWowPackages.stable
    pkgs.gamemode
  ];
}