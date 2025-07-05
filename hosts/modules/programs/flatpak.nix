{pkgs, lib, nix-flatpak, ...}:

{
  environment.systemPackages = lib.mkAfter [
    pkgs.flatpak
    pkgs.gnome-software
  ];

  services.flatpak.enable = true;

  services.flatpak.overrides.global = {
    Context.sockets = ["wayland" "!x11" "!fallback-x11"];

    Context.filesystem = [
      "/home/emilj00/.themes:ro"
      "/home/emilj00/.icons:ro"
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