{ pkgs, ... }:

{
  imports = [
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

  programs.thunar = {
    enable = true;
    plugins = [ pkgs.xfce.thunar-archive-plugin ];
  };

  environment.systemPackages = with pkgs; [
    gnome.gnome-themes-extra
  ];
}
