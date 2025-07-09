{pkgs, lib, ...}:

{
  boot.kernelPackages = pkgs.linuxPackages_6_15;
}