{ pkgs, ... }:

# Configurable settings for the system
let
  usrs = {
    laxa = {
      isNormalUser = true;
      description = "laxa";
      extraGroups = [ "networkmanager" "wheel" "docker" "dialout" "plugdev" "vboxusers" ];
    };
  };

  grps = {
    networkmanager = {};
    wheel = {};
    docker = {};
    dialout = {};
    plugdev = {};
  };
in
# Do not modify below this line
  {
    imports =
      [
        ./hardware-configuration.nix
	./gpu.nix
        ./locale.nix
        ./networking.nix
        ./udev_rule.nix
        ./security.nix
        ./global_applications.nix
        ./env.nix
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
      users = usrs;
      groups = grps;
    };

    # Enable CUPS to print documents.
    services.printing.enable = true;
    services.gvfs.enable = true;

    nix = {
      package = pkgs.nixFlakes;
      extraOptions = "experimental-features = nix-command flakes";
    };

    system.stateVersion = "24.05";
  }
