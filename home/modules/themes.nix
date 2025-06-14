{ pkgs, ... }:

let
  theme = pkgs.runCommand "unpack-gruvbox-dark" {
    buildInputs = [ pkgs.unzip ];
    src = pkgs.fetchurl {
      url = "https://ocs-dl.fra1.cdn.digitaloceanspaces.com/data/files/1641887808/Gruvbox-Dark-B-MB.zip?response-content-disposition=attachment%3B%2520Gruvbox-Dark-B-MB.zip&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=RWJAQUNCHT7V2NCLZ2AL%2F20250615%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20250615T171840Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Signature=14e975190c4221ca16c67abf513d94aee146cc71c90548368a27842620959a93";
      sha256 = "17lm5fr31xnh933bgvz8vpvb3c9ic8wn6xgjxvaqmb41v5g47ks7";
    };
  } ''
    mkdir -p $out
    unzip -q $src -d $out
  '';

  gruvboxDarkDir = "${theme}/Gruvbox-Dark";
in

{
  home.file.".config/cinnamon".source = "${gruvboxDarkDir}/cinnamon";
  home.file.".config/gnome-shell".source = "${gruvboxDarkDir}/gnome-shell";
  home.file.".config/gtk-2.0".source = "${gruvboxDarkDir}/gtk-2.0";
  home.file.".config/gtk-3.0".source = "${gruvboxDarkDir}/gtk-3.0";
  home.file.".config/gtk-4.0".source = "${gruvboxDarkDir}/gtk-4.0";
  home.file.".config/index.theme".source = "${gruvboxDarkDir}/index.theme";
  home.file.".config/metacity-1".source = "${gruvboxDarkDir}/metacity-1";
  home.file.".config/plank".source = "${gruvboxDarkDir}/plank";
  home.file.".config/xfwm4".source = "${gruvboxDarkDir}/xfwm4";
}