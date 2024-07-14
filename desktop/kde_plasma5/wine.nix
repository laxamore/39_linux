{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Wine and Windows Compatibility
    wineWowPackages.staging
    winetricks
  ];
}