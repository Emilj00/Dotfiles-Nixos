{pkgs, ...}:

{
  environment.systemPackages = with pkgs; (config.environment.systemPackages or []) ++ [
    flatpak
  ];

  services.flatpak.enable = true;
  # services.flatpak.remotes = [
  #   {
  #     name = "flathub";
  #     url = "https://flathub.org/repo/flathub.flatpakrepo";
  #     default = true;
  #   }
  # ];
}