{ pkgs, ... }:

{
  imports = [
    ./audio.nix
    ./fonts.nix
    ./virtualization.nix
  ];

  # Enable the KDE Plasma 5 desktop environment
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.sddm.wayland.enable = false;
  services.xserver.displayManager.defaultSession = "plasma";
  services.xserver.desktopManager.plasma5.enable = true;

  # exclude some packages from the plasma5 desktop environment
  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    plasma-browser-integration
    oxygen
  ];

  # GNOME desktop integration
  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  programs.dconf.enable = true;
}
