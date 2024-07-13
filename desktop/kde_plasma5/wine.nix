{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Wine and Windows Compatibility
    wineWowPackages.waylandFull
    winetricks
  ];
}