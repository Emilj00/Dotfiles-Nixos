{ lib, pkgs, ... }:

let
  apps = {
    "x-scheme-handler/http"  = [ "app.zen_browser.zen.desktop" ];
    "x-scheme-handler/https" = [ "app.zen_browser.zen.desktop" ];
    "image/png"  = [ "org.gnome.gThumb.desktop" ];
    "image/jpeg" = [ "org.gnome.gThumb.desktop" ];
    "image/jpg"  = [ "org.gnome.gThumb.desktop" ];
    "image/gif"  = [ "org.gnome.gThumb.desktop" ];
    "image/bmp"  = [ "org.gnome.gThumb.desktop" ];
  };
in {
  xdg.mimeApps = {
    enable = true;
    associations.added = apps;
    defaultApplications = apps;
  };
}
