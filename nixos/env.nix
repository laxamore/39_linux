{ pkgs, ... }:

{
  imports = [];

  environment.variables={
    NIXOS_OZONE_WL = "1";
    EDITOR = "nvim";
  };
}