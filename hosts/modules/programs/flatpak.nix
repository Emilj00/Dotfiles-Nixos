{pkgs, lib, nix-flatpak, ...}:

{
  environment.systemPackages = lib.mkAfter [
    pkgs.flatpak
  ];

  services.flatpak.enable = true;

  services.flatpak.remotes = [{
    name = "flathub"; 
    location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
  }];

  services.flatpak.packages = [
    # "app/app.zen_browser.zen/x86_64/stable"
  ];
}