{ config, pkgs, nix-flatpak, ... }:

{
  imports = [
    nix-flatpak.homeManagerModules.nix-flatpak
    ./flatpak.nix
  ];

  home.username = "nitsua";
  home.homeDirectory = "/home/nitsua";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    # Add user-specific packages here
    # firefox
    # vscode
  ];

  # programs.git = {
  #   enable = true;
  #   userName = "Your Name";
  #   userEmail = "your.email@example.com";
  # };
}
