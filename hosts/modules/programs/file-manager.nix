{pkgs, lib, ...}:

{
  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "alacritty";
  };

  environment.systemPackages = lib.mkAfter [
    pkgs.nautilus
    pkgs.gvfs
    pkgs.udisks2
    pkgs.unzip
    pkgs.unrar
  ];

  services.gvfs.enable = true;
  services.dbus.enable = true;
}