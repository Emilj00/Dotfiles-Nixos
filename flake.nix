{
  description = "Nixos configuration for all my devices";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.6.0";
  };

  outputs = { self, nixpkgs, home-manager, nix-flatpak, ... }:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in
  {
    nixosConfigurations = {
      thinkpad-host = nixpkgs.lib.nixosSystem {
        inherit system pkgs;

        modules = [
          ./hosts/thinkpad-host.nix

          nix-flatpak.nixosModules.nix-flatpak

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.emilj00 = import ./home/home-config.nix;
          }
        ];
      };

      gigabyte-host = nixpkgs.lib.nixosSystem {
        inherit system pkgs;

        modules = [
          ./hosts/gigabyte-host.nix

          nix-flatpak.nixosModules.nix-flatpak

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.emilj00 = import ./home/home-config.nix;
          }
        ];
      };
    };
  };
}