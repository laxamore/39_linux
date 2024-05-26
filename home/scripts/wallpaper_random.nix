{ pkgs, ... }:

let
  wallpaper_random = pkgs.writeShellScriptBin "wallpaper_random" ''
    #!/usr/bin/env bash

    if command -v swww >/dev/null 2>&1; then 
        killall dynamic_wallpaper
        swww img $(find ~/Pictures/Wallpapers/. -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" | shuf -n1) --transition-type simple
    fi
  '';

in
{
  home.packages = with pkgs; [
    wallpaper_random
  ];
}
