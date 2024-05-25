{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = [ (pkgs.rofi-calc.override {
      rofi-unwrapped = pkgs.rofi-wayland-unwrapped;
    }) ];
    terminal = "${pkgs.kitty}/bin/kitty";
    theme = ./theme.rasi;
  };

  home.file.".config/rofi/theme.rasi".text = (builtins.readFile ./theme.rasi);
  home.file.".config/rofi/colors/dracula.rasi".text = (builtins.readFile ./colors/dracula.rasi);
}
