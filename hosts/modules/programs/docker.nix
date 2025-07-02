{pkgs, lib, ...}:

{
  virtualisation.docker.enable = true;

  environment.systemPackages = lib.mkAfter [
    pkgs.lazydocker
  ];
}