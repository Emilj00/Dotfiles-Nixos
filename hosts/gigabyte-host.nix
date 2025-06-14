{ config, pkgs, lib, ... }:

{
  imports = [
    ./modules
    ./gigabyte-hardware-configuration.nix
  ];

  networking.hostName = "gigabyte";
  
}