{ pkgs, ...}: {

  imports = [
    ./configs
    ./scripts
    ./user_applications
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  home = {
    username = "laxa";
    homeDirectory = "/home/laxa";
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };

      "org/gnome/shell/extensions/user-theme" = {
        name = "Adwaita-dark";
      };
    };
  };

  xdg.systemDirs.data = [
    "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}"
    "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
  ];

  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "23.11";
}
