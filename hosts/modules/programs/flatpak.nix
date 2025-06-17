{pkgs, lib, nix-flatpak, ...}:

{
  environment.systemPackages = lib.mkAfter [
    pkgs.flatpak
  ];

  services.flatpak.enable = true;

  services.flatpak.overrides.global = {
    Environment.GTK_THEME = "Gruvbox-Dark";
    Context.filesystem = [
      (lib.mkForce "$HOME/.themes:ro")
      (lib.mkForce "$HOME/.icons:ro")
    ];
  };

  services.flatpak.remotes = [{
    name = "flathub";
    location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
  }];

  services.flatpak.packages = [
    "app/app.zen_browser.zen/x86_64/stable"
  ];
}