{pkgs, lib, nix-flatpak, ...}:

{
  environment.systemPackages = lib.mkAfter [
    pkgs.flatpak
    pkgs.gnome-software
  ];

  services.flatpak.enable = true;

  services.flatpak.overrides.global = {
    Environment.GTK_THEME = "Gruvbox";
    Context.filesystem = [
      "/home/emilj00/.themes:ro"
      "/home/emilj00/.icons:ro"
    ];
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