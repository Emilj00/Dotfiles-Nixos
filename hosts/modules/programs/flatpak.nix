{pkgs, nix-flatpak, ...}:

{
  environment.systemPackages = with pkgs; (config.environment.systemPackages or []) ++ [
    flatpak
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