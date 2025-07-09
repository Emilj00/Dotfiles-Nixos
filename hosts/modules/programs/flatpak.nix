{pkgs, lib, nix-flatpak, ...}:

{
  environment.systemPackages = [
    pkgs.flatpak
    pkgs.gnome-software
  ];

  services.flatpak.enable = true;

  services.flatpak.overrides.global = {
    Context.sockets = ["wayland" "!x11" "!fallback-x11"];

    Context.filesystem = [
      "/nix/store/:ro"
      "/home/emilj00/.themes/Gruvbox-Dark:ro"
      "/home/emilj00/.icons/Bibata-Modern-Classic:ro"
    ];

    Environment = {
      GTK_THEME = "Gruvbox-Dark";
      XCURSOR_THEME="Bibata-Modern-Classic";
      XCURSOR_SIZE="24";
    };
  };

  services.flatpak.remotes = [{
    name = "flathub";
    location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
  }];

  services.flatpak.packages = [
    "app/app.zen_browser.zen/x86_64/stable"
    "org.gnome.gThumb"
  ];
}