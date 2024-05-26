{ pkgs, ... }:

{
  imports = [
    ./audio.nix
    ./fonts.nix
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
    # config.common.default = "*";
    extraPortals = [ 
      pkgs.xdg-desktop-portal-gtk 
    ];
  };
}