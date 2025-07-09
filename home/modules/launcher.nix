{ pkgs, config, lib, ... }:

{
  home.packages = [
    pkgs.rofi-wayland
  ];

  home.file.".config/rofi" = {
    source = ../config/rofi;
    recursive = true;
  };
}
