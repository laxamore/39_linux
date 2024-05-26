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

      rustup
      rustc
      gcc
      kicad
      docker
      openssl
      pkg-config
    ]);
}