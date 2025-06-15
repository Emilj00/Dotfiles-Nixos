{ config, lib, pkgs, ... }:

{
  home.packages = lib.mkAfter [ 
    pkgs.swaybg
  ];
}
