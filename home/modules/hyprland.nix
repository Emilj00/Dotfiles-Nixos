{ config, pkgs, ... }:

{
  home.file.".config/hypr" = {
    source = ../config/hypr;
  };
}