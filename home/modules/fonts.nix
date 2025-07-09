{ pkgs, config, lib, ... }:

{
  home.packages = [
    pkgs.dejavu_fonts
    pkgs.jetbrains-mono
    pkgs.noto-fonts
    pkgs.noto-fonts-lgc-plus
    pkgs.texlivePackages.hebrew-fonts
    pkgs.noto-fonts-emoji
    pkgs.font-awesome
    pkgs.powerline-fonts
    pkgs.powerline-symbols
    pkgs.nerd-fonts.jetbrains-mono
  ];
}