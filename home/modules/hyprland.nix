{ config, ... }:

{
  home.file.".config/hypr" = {
    source = ../config/hypr;
  };
}