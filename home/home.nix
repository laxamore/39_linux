{ pkgs, ...}: {

  imports = [
    ./configs
    ./user_applications
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  home = {
    username = "laxa";
    homeDirectory = "/home/laxa";
  };

  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "24.05";
}
