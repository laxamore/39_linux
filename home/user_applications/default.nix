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
    
    # Password Manager
    keepassxc
    
    # Cloud Services
    nextcloud-client
    
    # Multimedia
    mpv
    ardour
    pavucontrol
    
    # Utility Tools
    appimage-run
    tmux
    neofetch
    unrar
    
    # Wine and Windows Compatibility
    wineWowPackages.waylandFull
    winetricks
    
    # Office
    libreoffice
    
    # Hardware Utilities
    usbutils
    pciutils
    
    # Gaming
    steam
    
    # 3D Printing
    bambu-studio

    # Virtualbox
    virtualbox
  ]);

}
