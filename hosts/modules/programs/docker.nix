{pkgs, lib, ...}:

{
  virtualisation.docker.enable = true;

  environment.systemPackages = [
    pkgs.lazydocker
  ];
}