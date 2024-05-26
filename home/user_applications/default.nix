{ pkgs, ... }:

{
  imports = [
    ./zsh
  ];

  home.packages =
    (with pkgs; [
      brave
      discord
      vscode
      keepassxc
      nextcloud-client
      tokyo-night-gtk
      catppuccin-gtk
      stm32cubemx
      dotnet-runtime
      pavucontrol
      grim
      swappy
      slurp
      webp-pixbuf-loader
      ffmpegthumbnailer
      appimage-run
      nwg-look

      wineWowPackages.waylandFull
      winetricks

      zoom-us

      mpv

      postman

      dbeaver-bin

      ardour
      libreoffice

      lxqt.lxqt-policykit
      nwg-displays
      kitty
      tmux
      wl-clipboard
      cliphist
      nautilus-open-any-terminal
      dconf
      swww
      networkmanagerapplet
      dunst
      gnome.gnome-tweaks
      gnome.eog
      gnome.zenity
      gnome.nautilus
      gnome.gnome-themes-extra
      gdk-pixbuf

      rustup
      rustc
      gcc
      kicad
      docker-compose
      openssl
      pkg-config

      usbutils
      pciutils
    ]);
}