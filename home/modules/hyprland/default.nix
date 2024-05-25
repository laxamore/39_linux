{ config, ... }:

{
  home = {
    sessionVariables = {
      EDITOR = "lvim";
      BROWSER = "brave";
      TERMINAL = "kitty";
      GBM_BACKEND= "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME= "nvidia";
      LIBVA_DRIVER_NAME= "nvidia"; # hardware acceleration
      __GL_VRR_ALLOWED="1";
      WLR_NO_HARDWARE_CURSORS = "1";
      WLR_RENDERER_ALLOW_SOFTWARE = "1";
      CLUTTER_BACKEND = "wayland";
      WLR_RENDERER = "vulkan";

      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
    };
  };

  home.file.".config/hypr/hyprland.conf".source = config.lib.file.mkOutOfStoreSymlink ./hyprland.conf;

  wayland.windowManager.hyprland = {
    enable = true;
    # extraConfig = (builtins.readFile ./hyprland.conf);
  };
}
