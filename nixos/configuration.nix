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
      ./compat
      ./global_applications
      ../desktop
    ];

  environment.fhs.enable = true;
  environment.fhs.linkLibs = true;
  environment.lsb.enable = true;
  environment.lsb.support32Bit = true;

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
        extraGroups = [ "networkmanager" "wheel" "docker" ];
      };
    };
  };

  environment.variables={
    NIXOS_OZONE_WL = "1";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.gvfs.enable = true;

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };

  system.stateVersion = "23.11";
}
