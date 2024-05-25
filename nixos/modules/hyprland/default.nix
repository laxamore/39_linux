{ pkgs, ... }:

{
  environment.sessionVariables = rec {
    NIXOS_OZONE_WL="y";
    EDITOR = "nvim";
    BROWSER = "brave";
    TERMINAL = "kitty";

    #GBM_BACKEND= "nvidia-drm";
    #__GLX_VENDOR_LIBRARY_NAME= "nvidia";
    #LIBVA_DRIVER_NAME= "nvidia"; # hardware acceleration
    #__GL_VRR_ALLOWED="1";
    #WLR_NO_HARDWARE_CURSORS = "1";
    #WLR_RENDERER_ALLOW_SOFTWARE = "1";
    #CLUTTER_BACKEND = "wayland";
    #WLR_RENDERER = "vulkan";

    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
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
      xwayland.enable = true;
    };

    dconf.enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common.default = "*";
  };
}
