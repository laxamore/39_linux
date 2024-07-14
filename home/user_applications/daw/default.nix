{ pkgs, ... }:

{
  home.packages = (with pkgs; [
    ardour
    yabridge
    yabridgectl
    carla
  ]);
}