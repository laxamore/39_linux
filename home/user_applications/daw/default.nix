{ pkgs, ... }:

{
  home.packages = (with pkgs; [
    ardour
    yabridge
    yabridgectl
    carla
  ]);

  home.sessionVariables = {
    WINELOADER = "${pkgs.wineWowPackages.waylandFull.out}/bin/wine64";
  };
}