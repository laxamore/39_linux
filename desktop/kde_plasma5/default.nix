{ pkgs, ... }:

{
  imports = [
    ./audio.nix
    ./fonts.nix
    ./virtualization.nix
    ./wine.nix
    ./gaming.nix
  ];

  # Enable the KDE Plasma 5 desktop environment
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = false;
  services.displayManager.defaultSession = "plasma";
  services.xserver.desktopManager.plasma5.enable = true;

  # exclude some packages from the plasma5 desktop environment
  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    plasma-browser-integration
    oxygen
  ];

  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    # KDE Apps
    kdePackages.kdialog
    kdePackages.kcalc
    kdePackages.kate

    # Utilities
    xsel
    xclip
  ];

  # Settings
  services.libinput.touchpad.naturalScrolling = true;
}
