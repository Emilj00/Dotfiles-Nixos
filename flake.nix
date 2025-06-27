{
  description = "Nixos configuration for all my devices";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak = {
      url = "github:gmodena/nix-flatpak/?ref=v0.6.0";
    };
  };

  outputs = { self, nixpkgs, home-manager, nix-flatpak, ... }:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };



    shellFiles = builtins.readDir ./shells;

    shellNames =
      builtins.filter
        (name: shellFiles.${name} == "regular" && builtins.match ".*\\.nix" name != null)
        (builtins.attrNames shellFiles);

    devShells =
      builtins.listToAttrs
        (map
          (name: {
            name = builtins.replaceStrings [".nix"] [""] name;
            value = import (./shells + "/${name}") { inherit pkgs; };
          })
          shellNames);




    makeHostConfig = hostName: import ./hosts/${hostName}.nix;

    makeNixosConfig = hostName: nixpkgs.lib.nixosSystem {
      inherit system pkgs;

      modules = [
        (makeHostConfig hostName)

        nix-flatpak.nixosModules.nix-flatpak

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.emilj00 = {
            _module.args.hostName = hostName;
            imports = [ ./home/home-config.nix ];
          };
        }
      ];
    };
  in
  {
    nixosConfigurations = {
      thinkpad-host = makeNixosConfig "thinkpad-host";
      gigabyte-host = makeNixosConfig "gigabyte-host";
    };

    devShells.${system} = devShells;
  };
}
