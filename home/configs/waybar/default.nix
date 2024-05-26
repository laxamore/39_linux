{ config, lib, pkgs, ... }:

{
    programs.waybar = {
      enable = true;
      systemd = {
        enable = false;
        target = "graphical-session.target";
      };
      style = (builtins.readFile ./style.css);
    };

    home.file.".config/waybar/config".source = ./waybar_config;
}