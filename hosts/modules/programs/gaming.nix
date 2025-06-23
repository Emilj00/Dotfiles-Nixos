{pkgs, lib, ...}:

{
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;

  programs.gamemode.enable = true;

  environment.systemPackages = lib.mkAfter [
    pkgs.wineWowPackages.stable
    pkgs.umu-launcher
    pkgs.winetricks
    pkgs.p7zip
    pkgs.dxvk
    pkgs.vkd3d
  ];

  services.syncthing = {
    enable = true;
    openDefaultPorts = true;

    settings.gui = {
      user = "emilj00";
      password = "password";
    };
  };
}

# WINEPREFIX=/home/emilj00/.wine \
# GAMEID=480 \
# PROTONPATH="/home/emilj00/.steam/steam/steamapps/common/Proton - Experimental" \
# WINEDLLOVERRIDES="OnlineFix64=n;SteamOverlay64=n;winmm=n,b;dnet=n;steam_api64=n" \
# umu-run /home/emilj00/Games/The\ Headliners/Headliners.exe