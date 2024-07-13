{ pkgs, ... }:
let
  yabridge-patched = pkgs.yabridge.overrideAttrs (oldAttrs: rec {
    name = "yabridge-patched";
    postFixup = ''
        substituteInPlace "$out/bin/yabridge-host-32.exe" \
          --replace 'exec "$WINELOADER"' 'exec wine'

        substituteInPlace "$out/bin/yabridge-host.exe" \
          --replace 'exec "$WINELOADER"' 'exec wine64'
      '';
  });
in
  {
    home.packages = (with pkgs; [
      ardour
      yabridge-patched
      yabridgectl
      carla
    ]);
  }