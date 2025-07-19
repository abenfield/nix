# flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-flatpak.url = "github:gmodena/nix-flatpak/latest";
  };
  outputs = inputs@{ self, nixpkgs, home-manager, nix-flatpak, ... }:
    let
      system = "x86_64-linux";
    in
    {


      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs.flake-inputs = inputs;
            home-manager.users."nitsua".imports = [
              nix-flatpak.homeManagerModules.nix-flatpak
             ./flatpak.nix
            ];
            home-manager.users.nitsua.home.stateVersion = "25.05";
          }
          ./configuration.nix
        ];
      };
    };
}
