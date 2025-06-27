{ pkgs }:

pkgs.mkShell {
  packages = [
    pkgs.nodejs 
    pkgs.yarn 
  ];
}