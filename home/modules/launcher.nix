{ pkgs, config, lib, ... }:

{
  home.packages = lib.mkAfter [
    pkgs.rofi-wayland
  ];

  home.file.".config/rofi" = {
    source = ../config/rofi;
    recursive = true;
  };
}
