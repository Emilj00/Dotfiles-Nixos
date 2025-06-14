{pkgs, ...}:

{
  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "alacritty";
  };

  environment.systemPackages = with pkgs; (config.environment.systemPackages or []) ++ [
    nautilus
    gvfs
    udisks2
    unzip
    unrar
  ];

  services.gvfs.enable = true;
  services.dbus.enable = true;
}