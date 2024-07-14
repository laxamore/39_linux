
{ pkgs, ... }:

{
  imports = [
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
    nix-index
  ];

  programs.zsh.enable = true;

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
  };
}
