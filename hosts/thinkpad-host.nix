{ config, pkgs, lib, ... }:

{
  imports = [
    ./modules
    ./thinkpad-hardware-configuration.nix
  ];

  networking.hostName = "thinkpad";
}