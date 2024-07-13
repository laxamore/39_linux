{ pkgs, ... }:

{
  imports = [
    ./neovim.nix
  ];

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    wget
    curl
    htop
    rsync
    btop
    home-manager
    git
    glib
    arc-icon-theme
    xarchiver
  ];

  programs.zsh.enable = true;
}
