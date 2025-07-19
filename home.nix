{ config, pkgs, flake-inputs, ... }:

{
  imports = [
    flake-inputs.nix-flatpak.homeManagerModules.nix-flatpak
    ./flatpak.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "nitsua";
  home.homeDirectory = "/home/nitsua";

  # This value determines the Home Manager release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # User packages (can be moved here from system packages if user-specific)
  home.packages = with pkgs; [
    # Add user-specific packages here
    # firefox
    # vscode
  ];

  # User-specific program configurations
  # programs.git = {
  #   enable = true;
  #   userName = "Your Name";
  #   userEmail = "your.email@example.com";
  # };
} 