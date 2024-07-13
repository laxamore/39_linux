{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Wine and Windows Compatibility
    wineWowPackages.waylandFull
    winetricks
  ];

  environment.variables={
    WINELOADER = "${pkgs.wineWowPackages.waylandFull.out}/bin/wine64";
  };
}