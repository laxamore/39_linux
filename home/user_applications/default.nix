{ pkgs, ... }:

{
  imports = [
    ./zsh
  ];

  home.packages = (with pkgs; [
    # Web Browsers
    brave
    
    # Communication
    discord
    zoom-us
    
    # Development Tools
    vscode
    dotnet-runtime
    postman
    dbeaver-bin
    docker-compose
    kicad
    git
    stm32cubemx
    
    # Security
    keepassxc
    
    # Cloud Services
    nextcloud-client
    
    # Themes and Appearance
    tokyo-night-gtk
    catppuccin-gtk
    nwg-look
    
    # Multimedia
    ffmpegthumbnailer
    mpv
    ardour
    pavucontrol
    
    # Screenshot and Screen Recording
    grim
    swappy
    slurp
    
    # Image Tools
    webp-pixbuf-loader
    
    # Utility Tools
    appimage-run
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
    neofetch
    
    # Wine and Windows Compatibility
    wineWowPackages.waylandFull
    winetricks
    
    # Office
    libreoffice
    
    # Desktop Environment and System Tools
    lxqt.lxqt-policykit
    gdk-pixbuf
    xfce.thunar
    
    # Hardware Utilities
    usbutils
    pciutils
    
    # Remote Desktop
    rustdesk
    
    # Gaming
    steam
    
    # 3D Printing
    bambu-studio
  ]);

}