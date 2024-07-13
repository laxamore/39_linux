{
  imports = [
    ./hyprland.nix
    ./file_manager.nix
    ./login.nix
    ./audio.nix
    ./fonts.nix
    ./virtualization.nix
  ];

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };

  programs.dconf.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ 
      pkgs.xdg-desktop-portal-gtk 
    ];
  };

  environment.systemPackages = with pkgs; [
    gnome.gnome-themes-extra
  ];
}
