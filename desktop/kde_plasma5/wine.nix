{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Wine and Windows Compatibility
    wineWowPackages.staging
    winetricks
  ];

  environment.variables = {
    WINEPREFIX = "~/.wine_kde_plasma5";
  };
}