{ pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./locale.nix
      ./login.nix
      ./networking.nix
      ./udev_rule.nix
      ./nix-ld.nix
      ./security.nix
      ./global_applications
      ../desktop
    ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
       efiSupport = true;
       device = "nodev";
    };
  };

  users = {
    defaultUserShell = pkgs.zsh;
    users = {
      laxa = {
        isNormalUser = true;
        description = "laxa";
        extraGroups = [ "networkmanager" "wheel" "docker" "dialout" "plugdev" ];
      };
    };

    groups.plugdev = {};
  };

  environment.variables={
    NIXOS_OZONE_WL = "1";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.gvfs.enable = true;

  services.xserver.desktopManager.gnome.extraGSettingsOverridePackages = with pkgs; [
    nautilus-open-any-terminal
  ];

  environment.variables.QT_QPA_PLATFORMTHEME = "qt5ct";

  nixpkgs.config.qt5 = {
    enable = true;
    platformTheme.name = "qt5ct"; 
    style = {
      package = pkgs.kvantum;
      name = "kvantum";
    };
};

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };

  system.stateVersion = "23.11";
}
