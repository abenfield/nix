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
          ./hardware-configuration.nix
          ./configuration.nix

          # Home Manager configuration
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # Only pass what you need to avoid infinite recursion
            home-manager.extraSpecialArgs.nix-flatpak = nix-flatpak;

            home-manager.users.nitsua = import ./home.nix;
          }
        ];
      };
    };
}
