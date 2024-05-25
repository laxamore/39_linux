{ config, pkgs, ...}: {

  imports = [
    ./modules
    ./scripts
  ];

  home = {
    username = "laxa";
    homeDirectory = "/home/laxa";
  };

  home.packages = (with pkgs; [
    brave
    discord
    vscode
    keepassxc
    nextcloud-client
    git
  ]);

  dconf = {
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "23.11";
}
