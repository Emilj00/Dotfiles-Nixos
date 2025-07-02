{ pkgs, lib, ... }:

let
  gtkTheme = pkgs.runCommand "unpack-gruvbox-gtk" {
    buildInputs = [ pkgs.unzip ];
    src = pkgs.fetchurl {
      url = "https://ocs-dl.fra1.cdn.digitaloceanspaces.com/data/files/1641887808/Gruvbox-Dark-Medium-BL-MB.zip?response-content-disposition=attachment%3B%2520Gruvbox-Dark-Medium-BL-MB.zip&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=RWJAQUNCHT7V2NCLZ2AL%2F20250619%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20250619T165819Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Signature=cea0819604948a839ce2a5647034a4a28f971ad07b59a4eee2369197af9a02e9";
      sha256 = "DwPuUe5peRWfnymTNkzZNfdQn/3rMFm2GNJNYTGFtiw=";
    };
  } ''
    mkdir -p $out
    unzip -q $src -d $out
    chmod -R 755 $out

    echo "[Settings]" > $out/Gruvbox-Dark-Medium/gtk-3.0/settings.ini
    echo "gtk-icon-theme-name=Gruvbox-Icons" >> $out/Gruvbox-Dark-Medium/gtk-3.0/settings.ini

    echo "[Settings]" > $out/Gruvbox-Dark-Medium/gtk-4.0/settings.ini
    echo "gtk-icon-theme-name=Gruvbox-Icons" >> $out/Gruvbox-Dark-Medium/gtk-4.0/settings.ini
  '';

  iconTheme = pkgs.runCommand "unpack-gruvbox-icons" {
    buildInputs = [ pkgs.unzip ];
    src = pkgs.fetchurl  {
      url = "https://github.com/SylEleuth/gruvbox-plus-icon-pack/releases/download/v6.2.0/gruvbox-plus-icon-pack-6.2.0.zip";
      sha256 = "D+SPhucHU4Riz0mzU1LnaEkkaQt+blJMAsA5r6fTAQ0=";
    };
  } ''
    mkdir -p $out
    unzip -q $src -d $out
    chmod -R 755 $out
  '';

  gruvboxGtkDir = "${gtkTheme}/Gruvbox-Dark-Medium";
  gruvboxIconsDir = "${iconTheme}/Gruvbox-Plus-Dark";
in
{
  home.file.".themes/Gruvbox-Dark".source = gruvboxGtkDir;
  home.file.".icons/Gruvbox-Icons".source = gruvboxIconsDir;

  home.file.".config/gtk-3.0/settings.ini".text = ''
    [Settings]
    gtk-icon-theme-name=Gruvbox-Icons
  '';

  home.file.".config/gtk-4.0/settings.ini".text = ''
    [Settings]
    gtk-icon-theme-name=Gruvbox-Icons
  '';

  home.file.".config/cinnamon".source = "${gruvboxGtkDir}/cinnamon";
  home.file.".config/gnome-shell".source = "${gruvboxGtkDir}/gnome-shell";
  home.file.".config/gtk-2.0".source = "${gruvboxGtkDir}/gtk-2.0";
  home.file.".config/gtk-3.0".source = "${gruvboxGtkDir}/gtk-3.0";
  home.file.".config/gtk-4.0".source = "${gruvboxGtkDir}/gtk-4.0";
  home.file.".config/index.theme".source = "${gruvboxGtkDir}/index.theme";
  home.file.".config/metacity-1".source = "${gruvboxGtkDir}/metacity-1";
  home.file.".config/plank".source = "${gruvboxGtkDir}/plank";
  home.file.".config/xfwm4".source = "${gruvboxGtkDir}/xfwm4";

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;

    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;

    size = 24;
  };
}