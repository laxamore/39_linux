{ pkgs, ... }:

{
  imports = [
    ./neovim.nix
  ];

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    killall
    wget
    curl
    htop
    rsync
    btop
    home-manager
    git
    glib
  ];

  programs.zsh.enable = true;
}
