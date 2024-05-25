{ pkgs, ... }:

{
  environment.sessionVariables = rec {
    NIXOS_OZONE_WL="y";
  };

  environment.systemPackages = with pkgs; [
    lxqt.lxqt-policykit
    nwg-displays
    kitty
    tmux
    wl-clipboard
    cliphist
    gnome.nautilus
    dconf
    swww
  ];

  programs = {
    xwayland.enable = true;

    hyprland = {
      enable = true;
      #xwayland.enable = true;
    };

    dconf.enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common.default = "*";
  };
}
