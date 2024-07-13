{ pkgs, ... }:

{
  imports = [
  ];

  programs.thunar = {
    enable = true;
    plugins = [ pkgs.xfce.thunar-archive-plugin ];
  };

}
