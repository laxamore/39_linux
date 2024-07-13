{ pkgs, ... }:

{
  imports = [
    ./zsh
    ./daw
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
    pavucontrol
    
    # Utility Tools
    appimage-run
    tmux
    neofetch
    unrar
    
    # Office
    libreoffice
    
    # Hardware Utilities
    usbutils
    pciutils
    lshw
    
    # Gaming
    steam
    
    # 3D Printing
    bambu-studio
  ]);

}
